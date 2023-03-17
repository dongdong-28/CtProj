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

    @GetMapping("/room/get-mem-list")
   @ResponseBody public ResponseEntity<List<String>> getMemList(HttpServletRequest request) throws Exception {

        Integer bno = Integer.parseInt(request.getParameter("bno"));
        List<String> list = null;
        try {
            list = enterService.selectRoomId(bno);
            System.out.println(list);
            return new ResponseEntity<>(list, HttpStatus.OK);   // 200
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);      //400
        }

    }

    // 강퇴하기
    @ResponseBody
    @DeleteMapping("/room/mem-drop/{bno}/{user_id}/{drop_num}")
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
//    @GetMapping("/room/get-mem-num")
//    @ResponseBody public ResponseEntity<Integer> getMemListNum(HttpServletRequest request) throws Exception {
//
//        Integer bno = Integer.parseInt(request.getParameter("bno"));
//        List<String> list = null;
//        Integer size = null;
//        try {
//            list = enterService.selectRoomId(bno);
//            size = list.size()+1;
//            return new ResponseEntity<>(size, HttpStatus.OK);   // 200
//        } catch (Exception e) {
//            e.printStackTrace();
//            return new ResponseEntity<>(size, HttpStatus.BAD_REQUEST);      //400
//        }
//
//    }

}