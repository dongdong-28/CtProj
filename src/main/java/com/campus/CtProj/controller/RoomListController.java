package com.campus.CtProj.controller;

import com.campus.CtProj.domain.RoomDto;
import com.campus.CtProj.service.RoomListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

//@Controller
//@ResponseBody
@RestController
public class RoomListController {
    @Autowired
    RoomListService service;

    // 회원에 따른 방들을 전부 보여주는 메서드
    @RequestMapping("/list-mem")
//      @ResponseBody
    public ResponseEntity<List<RoomDto>> listmem(HttpSession session)  {
        List<RoomDto> list_Mem = null;
        String user_id = (String)session.getAttribute("id");
        try {
            list_Mem =  service.readMem(user_id);
            // return 으로 그냥 list 를 보내는 것이 아니라 ResponseEntity<List<CommentDto>>(list, HttpStatus.OK) 를 쓴 이유는
            // 그냥 list 로 보내면 오류가 나도 응답은 200번대로 나온다 그래서 responseEntity를 사용해서 list 에다가 + 상태코드도 같이 보내주게 한다.
            return new ResponseEntity<>(list_Mem, HttpStatus.OK);   // 200
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<List<RoomDto>>(list_Mem, HttpStatus.BAD_REQUEST);      //400
        }



    }

    @RequestMapping("/list-host")
//      @ResponseBody
    public ResponseEntity<List<RoomDto>> listhost(HttpSession session)  {
        List<RoomDto> list_Host = null;
        String user_id = (String)session.getAttribute("id");
        try {
            list_Host =  service.readHost(user_id);
            // return 으로 그냥 list 를 보내는 것이 아니라 ResponseEntity<List<CommentDto>>(list, HttpStatus.OK) 를 쓴 이유는
            // 그냥 list 로 보내면 오류가 나도 응답은 200번대로 나온다 그래서 responseEntity를 사용해서 list 에다가 + 상태코드도 같이 보내주게 한다.
            return new ResponseEntity<>(list_Host, HttpStatus.OK);   // 200
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<List<RoomDto>>(list_Host, HttpStatus.BAD_REQUEST);      //400
        }

    }

//    // 방 입장하는 메서드
////    @ResponseBody
//    @PostMapping("/list")   // /ch4/comments?bno=1085 POST
//    // CommentDto 그대로 하면 안들어간다! 그래서 앞에 @RequestBody 를 붙여줘야한다
//    public ResponseEntity<String> read(HttpSession session) throws Exception{    // 입력한 내용을 받아와야하니깐 CommentDto dto 해줘야한다.
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


//    @ResponseBody
    // /comments/1?bno=1085         // 이 bno 는 그냥 쿼리스트링
    @DeleteMapping("/list-mem/{bno}")
    public ResponseEntity<String> removeMem(@PathVariable Integer bno, HttpSession session) throws Exception {
        String user_id = (String) session.getAttribute("id");

        try {
            int rowCnt = service.removeMem(bno, user_id);

            if(rowCnt != 1)
                throw new Exception("Delete Failed");
            return new ResponseEntity<>(HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("DEL_ERR",HttpStatus.BAD_REQUEST);
        }
    }

    @DeleteMapping("/list-host/{bno}")
    public ResponseEntity<String> removeHost(@PathVariable Integer bno, HttpSession session) throws Exception {
        String user_id = (String) session.getAttribute("id");

        try {
            int rowCnt = service.removeHost(bno, user_id);

            if(rowCnt != 1)
                throw new Exception("Delete Failed");
            return new ResponseEntity<>("삭제가 완료되었습니다.",HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("DEL_ERR",HttpStatus.BAD_REQUEST);
        }
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
//
//
////
    // 회원이 입장+ 생성한 방 총 수를 보여준다.
    @RequestMapping("/list-num")            // comments?bno=1080 GET
//      @ResponseBody
        public ResponseEntity<Integer> listNum( HttpSession session)  {
        Integer listNum = null;
        String user_id = (String) session.getAttribute("id");
        try {
            listNum =  service.getCount(user_id);
            return new ResponseEntity<Integer>(listNum, HttpStatus.OK);   // 200
        } catch (Exception e) {
                    e.printStackTrace();
            return new ResponseEntity<Integer>(listNum, HttpStatus.BAD_REQUEST);      //400
        }

    }




}

