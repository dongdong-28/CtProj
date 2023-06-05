package com.campus.CtProj.controller;

import com.campus.CtProj.domain.BoolDto;
import com.campus.CtProj.domain.RoomDto;
import com.campus.CtProj.domain.UserDto;
import com.campus.CtProj.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.*;

@Controller
@RequestMapping("/room-in")
public class RoomInController {
    RoomService roomService;
    RoomInService roomInService;
    EnterService enterService;
    UserService userService;


    public RoomInController(RoomService roomService,RoomInService roomInService,EnterService enterService, UserService userService){
        this.roomService = roomService;
        this.roomInService = roomInService;
        this.enterService = enterService;
        this.userService = userService;
    }


    // 방 입장 상태에서 나가기를 누르면 메인 홈으로 이동하게 한다.
    @PostMapping("/delete/mem")
    public String RemoveMem(HttpSession session, HttpServletRequest request) throws Exception {
        String user_id = (String)session.getAttribute("id");
        Integer room_bno = Integer.parseInt(request.getParameter("room_num"));
        int rowCnt = roomInService.removeMem(room_bno, user_id);
        return "redirect:/";
    }

    // 방 입장 상태에서 나가기를 누르면 메인 홈으로 이동하게 한다.
    @PostMapping("/delete/host")
    public String RemoveHost(HttpSession session, HttpServletRequest request) throws Exception {
        String user_id = (String)session.getAttribute("id");
        Integer room_bno = Integer.parseInt(request.getParameter("room-bno"));
        int rowCnt = roomInService.removeHost(room_bno);
        return "redirect:/";
    }

    @GetMapping("/list/mem")
   @ResponseBody public ResponseEntity<List<UserDto>> getMemList(HttpServletRequest request) throws Exception {
        Integer bno = Integer.parseInt(request.getParameter("bno"));
        List<String> list = null;
        List<UserDto> userList = new ArrayList<>();
        try {
            list = enterService.selectRoomId(bno);
            for(String memId: list) {
            userList.add(userService.getUser(memId));
            }

            System.out.println(userList);
            return new ResponseEntity<>(userList, HttpStatus.OK);   // 200
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(userList, HttpStatus.BAD_REQUEST);      //400
        }

    }

    // 후기를 위해서 방안의 유저정보가져옴
    @GetMapping("/list/mem/review")
    @ResponseBody public ResponseEntity<List<BoolDto>> getReviewMemList(HttpServletRequest request) throws Exception {
        Integer roomBno = Integer.parseInt(request.getParameter("bno"));
        List<BoolDto> list = null;
        try {
            list = roomInService.readReviewUser(roomBno);
            System.out.println(list);
            return new ResponseEntity<>(list, HttpStatus.OK);   // 200
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);      //400
        }

    }

    // 강퇴하기
    @ResponseBody
    @DeleteMapping("/drop/mem/{bno}/{user_id}/{drop_num}")
    public ResponseEntity<String> removeMemDrop(@PathVariable Integer bno,@PathVariable Integer drop_num, @PathVariable String user_id) throws Exception {

        System.out.println(user_id);

        try {
            int rowCnt = enterService.dropOut(bno, user_id,drop_num);

            if(rowCnt != 1)
                throw new Exception("Delete Failed");
            return new ResponseEntity<>(HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("DEL_ERR",HttpStatus.BAD_REQUEST);
        }
    }



    // 방장이 방 내용 수정하기
    @PostMapping("/upload")
    @ResponseBody public ResponseEntity<String> modifyHostRoom(RoomDto dto,@RequestParam("uploadFile")MultipartFile uploadfile, HttpSession session,HttpServletRequest request) throws Exception {    // 입력한 내용을 받아와야하니깐 CommentDto dto 해줘야한다.

        String writer = (String)session.getAttribute("id");
        RoomDto roomDto = roomInService.read(dto.getBno());

            System.out.println("사진지정");
            String path ="/upload";    // 저장할 경로지정
            String savePath = request.getServletContext().getRealPath("/resources"+path);
            System.out.println(savePath);
            UUID uuid = UUID.randomUUID();      // 파일 이름앞에 붙일 랜덤 이름 생성
            String filename = uuid + "_"+uploadfile.getOriginalFilename();

            File saveFile = new File(savePath,filename);               // 파일 넣어줄 껍데기 만들고 경로 , 이름 생성
            uploadfile.transferTo(saveFile);
            String filepath = path+"/"+filename;
            dto.setFilename(filename);
            dto.setFilepath(filepath);

        System.out.println(dto);

        dto.setWriter(writer);

        try {
            if(roomService.modify(dto) != 1)
                throw new Exception("Write failed. ");
            return new ResponseEntity<>("MOD_OK", HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("MOD_ERR", HttpStatus.BAD_REQUEST);
        }
    }

    // 모임이 끝나고 실제 참여한 인원들 확인버튼 누르기
    @ResponseBody
    @PostMapping("/mem/confirm")
    public ResponseEntity<String> confirm(@RequestBody BoolDto boolDto) throws Exception {

        try {
            int rowCnt = roomInService.confirmMem(boolDto.getRoom_bno(),boolDto.getUser_id(),1);

            if(rowCnt != 1)
                throw new Exception("Confirm Failed");
            return new ResponseEntity<>(HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("DEL_ERR",HttpStatus.BAD_REQUEST);
        }
    }

    // 확인 후에 방을 삭제하는 메서드
    @DeleteMapping("/mem/confirm/{bno}")       // /comments/1 <-- 삭제할 방 번호
    @ResponseBody
    public ResponseEntity<String> removeAterConfirm(@PathVariable Integer bno, HttpSession session) throws Exception {
        System.out.println("확인 후 삭제");
        String writer = (String) session.getAttribute("id");

        try {
            int rowCnt = roomInService.removeHostAterConfirm(bno);

            if (rowCnt != 1)
                throw new Exception("Delete Failed");
            return new ResponseEntity<>("DEL_OK", HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("DEL_ERR", HttpStatus.BAD_REQUEST);
        }
    }

}