package com.campus.CtProj.controller;

import com.campus.CtProj.domain.*;
import com.campus.CtProj.service.CommentService;
import com.campus.CtProj.service.RoomService;
import com.campus.CtProj.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.File;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@RestController
public class CommentController {
    CommentService commentService;
    UserService userService;

    @Autowired
    CommentController(CommentService commentService, UserService userService) {
        this.commentService = commentService;
        this.userService = userService;
    }


    // 댓글들 읽기
    @GetMapping("/comments")
    public ResponseEntity<List<CommentDto>> read(HttpServletRequest request) throws Exception {

        List<CommentDto> commentInfo = null;
        Integer bno = Integer.parseInt(request.getParameter("bno"));
        try {
            commentInfo = commentService.getList(bno);
            return new ResponseEntity<>(commentInfo, HttpStatus.OK);   // 200
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(commentInfo, HttpStatus.BAD_REQUEST);      //400
        }

    }


    // 댓글 쓰기
    @PostMapping("/comment")
    public ResponseEntity<String> write( CommentDto commentDto,Integer bno,HttpSession session) throws Exception {
        String writer = (String) session.getAttribute("id");
        UserDto userDto = null;
        try {
            userDto = userService.getUser(writer);
            commentDto.setCommenter(writer);
            commentDto.setNickname(userDto.getNickname());
            System.out.println("bno = " + bno);
            System.out.println("commentDto = " + commentDto);
            if (commentService.write(commentDto) != 1)
                throw new Exception("Write failed. ");
            return new ResponseEntity<>("WRT_OK", HttpStatus.OK);   // 200

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("WRT_FAIL", HttpStatus.BAD_REQUEST);      //400

        }


    }


    // 댓글 삭제
    @DeleteMapping("/comment/{cno}")
    public ResponseEntity<String> remove(@PathVariable Integer cno, HttpSession session) throws Exception {
        String writer = (String) session.getAttribute("id");
        System.out.println("cnt = " + cno);

        try {
            int rowCnt = commentService.remove(cno,writer);
            if (rowCnt != 1)
                throw new Exception("Delete Failed");
            return new ResponseEntity<>("DEL_OK", HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("DEL_ERR", HttpStatus.BAD_REQUEST);
        }
    }




    //  댓글 수정하기
    @PatchMapping("/comment/{cno}")
    public ResponseEntity<String> modify(@PathVariable Integer cno,@RequestBody CommentDto commentDto, HttpSession session) throws Exception {    // 입력한 내용을 받아와야하니깐 CommentDto dto 해줘야한다.
        String writer = (String) session.getAttribute("id");
        System.out.println("commentDto-MOD = " + commentDto);
        System.out.println("cno = " + cno);
//        System.out.println("comment = " + comment);

        try {
            commentDto.setCommenter(writer);
            commentDto.setCno(cno);
//            commentDto.setComment(comment);
//            commentDto.setComment(comment);
            System.out.println("commentDto-MOD = " + commentDto);
            if (commentService.modify(commentDto) != 1)
                throw new Exception("Write failed. ");
            return new ResponseEntity<>("MOD_OK", HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("MOD_ERR", HttpStatus.BAD_REQUEST);
        }
    }






}

