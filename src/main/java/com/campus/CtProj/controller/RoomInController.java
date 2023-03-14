package com.campus.CtProj.controller;

import com.campus.CtProj.domain.RoomDto;
import com.campus.CtProj.service.EnterService;
import com.campus.CtProj.service.RoomInService;
import com.campus.CtProj.service.RoomListService;
import com.campus.CtProj.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
//@RestController
public class RoomInController {
    @Autowired
    RoomInService service;
    @Autowired
    EnterService enterService;

//    // 회원에 따른 방들을 전부 보여주는 메서드
//    @PostMapping("/room-in/{bno}")
////      @ResponseBody
//    public ResponseEntity<RoomDto> roomIn(@PathVariable Integer bno,HttpSession session)  {
//        RoomDto dto = null;
//        String user_id = (String)session.getAttribute("id");
//        try {
//            dto =  service.read(bno);
//            // return 으로 그냥 list 를 보내는 것이 아니라 ResponseEntity<List<CommentDto>>(list, HttpStatus.OK) 를 쓴 이유는
//            // 그냥 list 로 보내면 오류가 나도 응답은 200번대로 나온다 그래서 responseEntity를 사용해서 list 에다가 + 상태코드도 같이 보내주게 한다.
//            return new ResponseEntity<>(dto, HttpStatus.OK);   // 200
//        } catch (Exception e) {
//            e.printStackTrace();
//            return new ResponseEntity<>(dto, HttpStatus.BAD_REQUEST);      //400
//        }
//
//    }

//    // 방 입장하는 메서드
////    @ResponseBody
//    @PostMapping("/room-inMem/{bno}")   // /ch4/comments?bno=1085 POST
//    // CommentDto 그대로 하면 안들어간다! 그래서 앞에 @RequestBody 를 붙여줘야한다
//    public ResponseEntity<String> roomInMem(@PathVariable Integer bno,HttpSession session) throws Exception{    // 입력한 내용을 받아와야하니깐 CommentDto dto 해줘야한다.
//        String user_id = (String) session.getAttribute("id");
//
//        dto.setUser_id(user_id);
//        service.readMem(user_id);
//
//        try {
//            if(service.enter(dto) != 1)
//                throw new Exception("Enter failed. ");
//            return new ResponseEntity<>("ENT_OK", HttpStatus.OK);
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            return new ResponseEntity<>("ENT_ERR", HttpStatus.BAD_REQUEST);
//        }
//    }

    // 방 입장 상태에서 나가기를 누르면 메인 홈으로 이동하게 한다.
    @PostMapping("/delete-room-mem")
    public String RemoveMem(Model m,HttpSession session, HttpServletRequest request) throws Exception {
        String user_id = (String)session.getAttribute("id");
        Integer room_bno = Integer.parseInt(request.getParameter("room_num"));
        int rowCnt = enterService.remove(room_bno, user_id);
        return "redirect:/";
    }

    // 방 입장 상태에서 나가기를 누르면 메인 홈으로 이동하게 한다.
    @PostMapping("/delete-room-host")
    public String RemoveHost(Model m,HttpSession session, HttpServletRequest request) throws Exception {
        String user_id = (String)session.getAttribute("id");
        Integer room_bno = Integer.parseInt(request.getParameter("room_num"));
        int rowCnt = service.leaveHost(room_bno, user_id);
        return "redirect:/";
    }




//   //  방안에 내용들을 수정하는 메서드
//    @ResponseBody
//    @PatchMapping("/rooms/{bno}")   // /ch4/comments/bno PATCH
//    // CommentDto 그대로 하면 안들어간다! 그래서 앞에 @RequestBody 를 붙여줘야한다
//    public ResponseEntity<String> modify(@PathVariable Integer bno,@RequestBody RoomDto dto)  {    // 입력한 내용을 받아와야하니깐 CommentDto dto 해줘야한다.
//        //        String writer = (String)session.getAttribute("id");
//
//        String writer = "17100725";
//        dto.setWriter(writer);
//        dto.setBno(bno);
//        System.out.println("dto = " + dto);
//
//        try {
//            if(service.modify(dto) != 1)
//                throw new Exception("Write failed. ");
//            return new ResponseEntity<>("MOD_OK", HttpStatus.OK);
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            return new ResponseEntity<>("MOD_ERR", HttpStatus.BAD_REQUEST);
//        }
//    }



    //    @ResponseBody
    // /comments/1?bno=1085         // 이 bno 는 그냥 쿼리스트링
//    @DeleteMapping("/roomin-mem/{bno}")
//    public ResponseEntity<String> removeMem(@PathVariable Integer bno, HttpSession session) throws Exception {
//        String user_id = (String) session.getAttribute("id");
//
//        try {
//            int rowCnt = service.leaveMem(bno, user_id);
//
//            if(rowCnt != 1)
//                throw new Exception("Delete Failed");
//            return new ResponseEntity<>("삭제가완료되었습니다.",HttpStatus.OK);
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            return new ResponseEntity<>("삭제에 실패하였습니다.",HttpStatus.BAD_REQUEST);
//        }
//    }

//    @DeleteMapping("/roomin-host/{bno}")
//    public ResponseEntity<String> removeHost(@PathVariable Integer bno, HttpSession session) throws Exception {
//        String user_id = (String) session.getAttribute("id");
//
//        try {
//            int rowCnt = service.leaveHost(bno, user_id);
//
//            if(rowCnt != 1)
//                throw new Exception("Delete Failed");
//            return new ResponseEntity<>("DEL_OK",HttpStatus.OK);
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            return new ResponseEntity<>("DEL_ERR",HttpStatus.BAD_REQUEST);
//        }
//    }


//   //  방안에 내용들을 수정하는 메서드
//    @ResponseBody
//    @PatchMapping("/rooms/{bno}")   // /ch4/comments/bno PATCH
//    // CommentDto 그대로 하면 안들어간다! 그래서 앞에 @RequestBody 를 붙여줘야한다
//    public ResponseEntity<String> modify(@PathVariable Integer bno,@RequestBody RoomDto dto)  {    // 입력한 내용을 받아와야하니깐 CommentDto dto 해줘야한다.
//        //        String writer = (String)session.getAttribute("id");
//
//        String writer = "17100725";
//        dto.setWriter(writer);
//        dto.setBno(bno);
//        System.out.println("dto = " + dto);
//
//        try {
//            if(service.modify(dto) != 1)
//                throw new Exception("Write failed. ");
//            return new ResponseEntity<>("MOD_OK", HttpStatus.OK);
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            return new ResponseEntity<>("MOD_ERR", HttpStatus.BAD_REQUEST);
//        }
//    }
//
//
////
//    // 모든 방을 가져온다
//    @RequestMapping("/list")            // comments?bno=1080 GET
////      @ResponseBody
//        public ResponseEntity<List<RoomDto>> list()  {
//        List<RoomDto> list = null;
//        try {
//            list =  service.readMem();
//       냥 list 로 보내면 오류가 나도 응답은 200번대로 나온다 그래서 responseEntity를 사용해서 list 에다가 + 상태코드도 같이 보내주게 한다.
//            return new ResponseEntity<List<RoomDto>>(list, HttpStatus.OK);   // 200
//        } catch (Exception e) {
//                    e.printStackTrace();
//            return new ResponseEntity<List<RoomDto>>(list, HttpStatus.BAD_REQUEST);      //400
//        }
//
//    }
}