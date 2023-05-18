package com.campus.CtProj.controller;

import com.campus.CtProj.domain.BoolDto;
import com.campus.CtProj.domain.ReviewDto;
import com.campus.CtProj.domain.RoomDto;
import com.campus.CtProj.service.EnterService;
import com.campus.CtProj.service.RoomInService;
import com.campus.CtProj.service.RoomListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;


@RestController
@RequestMapping("/list")
public class RoomListController {
    @Autowired
    RoomListService roomListService;
    @Autowired
    RoomInService roomInService;

    // 회원에 따른 방들을 전부 보여주는 메서드
    @GetMapping("/mem")
    public ResponseEntity<List<RoomDto>> memList(HttpSession session)  {
        List<RoomDto> memList = null;
        String user_id = (String)session.getAttribute("id");
        try {
            memList =  roomListService.readMem(user_id);
            return new ResponseEntity<>(memList, HttpStatus.OK);   // 200
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<List<RoomDto>>(memList, HttpStatus.BAD_REQUEST);      //400
        }
    }

    @GetMapping("/host")
    public ResponseEntity<List<RoomDto>> listhost(HttpSession session)  {
        List<RoomDto> hostList = null;
        String user_id = (String)session.getAttribute("id");
        try {
            hostList =  roomListService.readHost(user_id);
            return new ResponseEntity<>(hostList, HttpStatus.OK);   // 200
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<List<RoomDto>>(hostList, HttpStatus.BAD_REQUEST);      //400
        }

    }

    // 리스트에 후기 남길 정보들 나오게 하는 메서드
    @GetMapping("/review")
    @ResponseBody public ResponseEntity<List<BoolDto>> getReviewList(HttpSession session) throws Exception {
        String userId = (String) session.getAttribute("id");

        System.out.println("여기도 안드가져?");
        List<BoolDto> list = null;
        try {
            list = roomListService.readReviewList(userId);
            System.out.println(list);
            return new ResponseEntity<>(list, HttpStatus.OK);   // 200
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);      //400
        }

    }



    // 후기작성을 위해서 방안의 유저정보가져옴
    @GetMapping("/review/mem")
    @ResponseBody public ResponseEntity<List<ReviewDto>> getReviewMem( HttpServletRequest request) throws Exception {
        System.out.println("후기내용 안드가져?");
        Integer roomBno = Integer.parseInt(request.getParameter("bno"));

        List<ReviewDto> list = null;
        try {
            list = roomListService.readReviewUser(roomBno);
            System.out.println(list);
            return new ResponseEntity<>(list, HttpStatus.OK);   // 200
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);      //400
        }

    }




    @DeleteMapping("/mem/{bno}")
    public ResponseEntity<String> removeMem(@PathVariable Integer bno, HttpSession session) throws Exception {
        String user_id = (String) session.getAttribute("id");

        try {
            int rowCnt = roomInService.removeMem(bno, user_id);

            if(rowCnt != 1)
                throw new Exception("Delete Failed");
            return new ResponseEntity<>(HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("DEL_ERR",HttpStatus.BAD_REQUEST);
        }
    }



    @DeleteMapping("/host/{bno}")
    public ResponseEntity<String> removeHost(@PathVariable Integer bno, HttpSession session) throws Exception {
        String user_id = (String) session.getAttribute("id");

        try {
            int rowCnt = roomInService.removeHost(bno);

            if(rowCnt != 1)
                throw new Exception("Delete Failed");
            return new ResponseEntity<>("삭제가 완료되었습니다.",HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("DEL_ERR",HttpStatus.BAD_REQUEST);
        }
    }



    // 회원이 입장+ 생성한 방 총 수를 보여준다.
    @GetMapping("/num")            // comments?bno=1080 GET
        public ResponseEntity<Integer> listNum( HttpSession session)  {
        Integer listNum = null;
        String user_id = (String) session.getAttribute("id");
        try {
            listNum =  roomListService.getCount(user_id);
            return new ResponseEntity<Integer>(listNum, HttpStatus.OK);   // 200
        } catch (Exception e) {
                    e.printStackTrace();
            return new ResponseEntity<Integer>(listNum, HttpStatus.BAD_REQUEST);      //400
        }

    }




    // 후기 체크하기
    @PostMapping("/review/mem")
    @ResponseBody
    public ResponseEntity<String> modifyReview(String[] reviewKey,String[] reviewValue, HttpSession session) throws Exception {    // 입력한 내용을 받아와야하니깐 CommentDto dto 해줘야한다.
        String writer = (String)session.getAttribute("id");
        System.out.println(reviewKey);
        System.out.println(reviewValue);
        System.out.println(reviewKey.length);



        try {
            for(int i =0; i< reviewKey.length;i++){
                System.out.println(reviewKey[i] + " : " + reviewValue[i]);
                if (roomInService.modifyMemLevel(reviewKey[i],Integer.parseInt(reviewValue[i])) != 1)
                    throw new Exception("Modify failed. ");
            }

            return new ResponseEntity<>("MOD_OK", HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("MOD_ERR", HttpStatus.BAD_REQUEST);
        }
    }

    @DeleteMapping("/review/mem/{bno}")
    @ResponseBody
    public ResponseEntity<String> removeReviewAterConfirm(@PathVariable Integer bno, HttpSession session) throws Exception {
        System.out.println("확인 후 삭제");
        String writer = (String) session.getAttribute("id");

        try {
            int rowCnt = roomListService.removeReview(bno,writer);

            if (rowCnt != 1)
                throw new Exception("Delete Failed");
            return new ResponseEntity<>("DEL_OK", HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("DEL_ERR", HttpStatus.BAD_REQUEST);
        }
    }




}

