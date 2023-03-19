package com.campus.CtProj.controller;

import com.campus.CtProj.domain.RoomDto;
import com.campus.CtProj.domain.SearchCondition;
import com.campus.CtProj.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.sql.Timestamp;
import java.util.List;

@Controller
public class RoomController {
    @Autowired
    RoomService service;

    // 방 읽기
    @GetMapping("/room")
    @ResponseBody public ResponseEntity<RoomDto> read(HttpServletRequest request) throws Exception {

        RoomDto RoomInfo = null;
        Integer bno = Integer.parseInt(request.getParameter("bno"));
        try {
            RoomInfo =  service.read(bno);
            return new ResponseEntity<>(RoomInfo, HttpStatus.OK);   // 200
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(RoomInfo, HttpStatus.BAD_REQUEST);      //400
        }

    }

//    // 방 생성하는 메서드
////    @ResponseBody
//    @PostMapping("/test")
//    public String write(MultipartFile file, RoomDto roomDto, HttpSession session) throws Exception {    // 입력한 내용을 받아와야하니깐 CommentDto dto 해줘야한다.
//        String writer = (String)session.getAttribute("id");
//
//        roomDto.setWriter(writer);
//
//        System.out.println("dto = " + roomDto);
//        System.out.println("fil = " + file);
//
//        try {
//            if(roomService.write(roomDto,file) != 1)
//                throw new Exception("Write failed. ");
//
//            return "/index";
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            return "/roomFind";
//        }
//    }



    // 방을 삭제하는 메서드
    // {cno} 이거는 밑에 그냥 쿼리스트링으로 한게 아니고 rest 방식으로 한 url의 일부이므로 @PathVariable 을 붙여준다.
    @DeleteMapping("/rooms/{bno}")       // /comments/1 <-- 삭제할 방 번호
//    @ResponseBody
    // /comments/1?bno=1085         // 이 bno 는 그냥 쿼리스트링
    @ResponseBody public ResponseEntity<String> remove(@PathVariable Integer bno, HttpSession session) throws Exception {
        String writer = (String) session.getAttribute("id");

        try {
            int rowCnt = service.remove(bno, writer);

            if(rowCnt != 1)
                throw new Exception("Delete Failed");
            return new ResponseEntity<>("DEL_OK",HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("DEL_ERR",HttpStatus.BAD_REQUEST);
        }
    }

   //  방안에 내용들을 수정하는 메서드
   @PatchMapping("/rooms/{bno}")   // /ch4/comments/bno PATCH
    // CommentDto 그대로 하면 안들어간다! 그래서 앞에 @RequestBody 를 붙여줘야한다
   @ResponseBody public ResponseEntity<String> modify(@PathVariable Integer bno,@RequestBody RoomDto dto, HttpSession session)  {    // 입력한 내용을 받아와야하니깐 CommentDto dto 해줘야한다.
        String writer = (String)session.getAttribute("id");

        dto.setWriter(writer);
        dto.setBno(bno);
        System.out.println("dto = " + dto);

        try {
            if(service.modify(dto) != 1)
                throw new Exception("Write failed. ");
            return new ResponseEntity<>("MOD_OK", HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("MOD_ERR", HttpStatus.BAD_REQUEST);
        }
    }



    // 모든 방을 가져온다
    @GetMapping("/rooms")            // comments?bno=1080 GET
//      @ResponseBody
    @ResponseBody public ResponseEntity<List<RoomDto>> list()  {
        List<RoomDto> list = null;
        try {
            list =  service.getList();
            // return 으로 그냥 list 를 보내는 것이 아니라 ResponseEntity<List<CommentDto>>(list, HttpStatus.OK) 를 쓴 이유는
            // 그냥 list 로 보내면 오류가 나도 응답은 200번대로 나온다 그래서 responseEntity를 사용해서 list 에다가 + 상태코드도 같이 보내주게 한다.
            return new ResponseEntity<List<RoomDto>>(list, HttpStatus.OK);   // 200
        } catch (Exception e) {
                    e.printStackTrace();
            return new ResponseEntity<List<RoomDto>>(list, HttpStatus.BAD_REQUEST);      //400
        }

    }

    // 방찾기 페이지에서 카테고리 선택하면 그에 맞는 방읽기
    @GetMapping("/rooms-category")
    @ResponseBody public ResponseEntity<List<RoomDto>> listCategory(String category){
        List<RoomDto> list = null;
        try {
            list =  service.readCategoryList(category);
            // return 으로 그냥 list 를 보내는 것이 아니라 ResponseEntity<List<CommentDto>>(list, HttpStatus.OK) 를 쓴 이유는
            // 그냥 list 로 보내면 오류가 나도 응답은 200번대로 나온다 그래서 responseEntity를 사용해서 list 에다가 + 상태코드도 같이 보내주게 한다.
            return new ResponseEntity<List<RoomDto>>(list, HttpStatus.OK);   // 200
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<List<RoomDto>>(list, HttpStatus.BAD_REQUEST);      //400
        }
    }

    // 검색으로 방 읽기
    @GetMapping("/rooms-search")
    public ResponseEntity<List<RoomDto>> SearchSelectPage(SearchCondition sc) throws Exception {
        List<RoomDto> list = null;
        try {
            list = service.getSearchSelectPage(sc);
            return new ResponseEntity<List<RoomDto>>(list, HttpStatus.OK);   // 200
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<List<RoomDto>>(list, HttpStatus.BAD_REQUEST);      //400
        }
    }

    }

