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
    EnterService enterService;

    public EnterController(EnterService enterService){
        this.enterService = enterService;
    }

    // 방 입장하는 메서드
//    @ResponseBody
    @PostMapping("/enter/")   // /ch4/comments?bno=1085 POST
    // CommentDto 그대로 하면 안들어간다! 그래서 앞에 @RequestBody 를 붙여줘야한다
    public ResponseEntity<String> write(@RequestBody EnterDto dto, HttpSession session) {    // 입력한 내용을 받아와야하니깐 CommentDto dto 해줘야한다.
        String user_id = (String)session.getAttribute("id");
        dto.setUser_id(user_id);
        try {
            if(enterService.enter(dto) != 1)
                throw new Exception("Enter failed. ");
            return new ResponseEntity<>("ENT_OK", HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("ENT_ERROR", HttpStatus.BAD_REQUEST);
        }
    }


}