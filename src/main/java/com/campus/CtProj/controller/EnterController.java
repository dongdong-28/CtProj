package com.campus.CtProj.controller;

import com.campus.CtProj.domain.EnterDto;
import com.campus.CtProj.service.EnterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

//@Controller
//@ResponseBody
@RestController
public class EnterController {
    @Autowired
    EnterService service;

    // 방 입장하는 메서드
//    @ResponseBody
    @PostMapping("/enter/{bno}")   // /ch4/comments?bno=1085 POST
    // CommentDto 그대로 하면 안들어간다! 그래서 앞에 @RequestBody 를 붙여줘야한다
    public ResponseEntity<String> write(@RequestBody EnterDto dto, @PathVariable Integer bno, HttpSession session) {    // 입력한 내용을 받아와야하니깐 CommentDto dto 해줘야한다.
        String user_id = (String)session.getAttribute("id");
        dto.setRoom_bno(bno);
        dto.setUser_id(user_id);
        try {
            if(service.enter(dto) != 1)
                throw new Exception("Enter failed. ");
            return new ResponseEntity<>("ENT_OK", HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("ENT_ERROR", HttpStatus.BAD_REQUEST);
        }
    }

//    // 방을 나가기
//    // {cno} 이거는 밑에 그냥 쿼리스트링으로 한게 아니고 rest 방식으로 한 url의 일부이므로 @PathVariable 을 붙여준다.
//    @DeleteMapping("/enter/{bno}")       // /comments/1 <-- 삭제할 방 번호
////    @ResponseBody
//    // /comments/1?bno=1085         // 이 bno 는 그냥 쿼리스트링
//    public ResponseEntity<String> remove(@PathVariable Integer bno, HttpSession session) throws Exception {
//        String user_id = (String) session.getAttribute("id");
//
//
//        try {
//            System.out.println(bno);
//            System.out.println(user_id);
//            int rowCnt = service.removeMem(bno, user_id);
//            System.out.println(rowCnt);
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


}