package com.campus.CtProj.controller;

import com.campus.CtProj.domain.RoomDto;
import com.campus.CtProj.domain.SearchCondition;
import com.campus.CtProj.service.RoomService;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.nio.file.Files;
import java.sql.Timestamp;
import java.util.List;
import java.util.UUID;

@Controller
public class RoomController {
    @Autowired
    RoomService service;

    // 방 읽기
    @GetMapping("/room")
    @ResponseBody
    public ResponseEntity<RoomDto> read(HttpServletRequest request) throws Exception {

        RoomDto RoomInfo = null;
        Integer bno = Integer.parseInt(request.getParameter("bno"));
        try {
            RoomInfo = service.read(bno);
            return new ResponseEntity<>(RoomInfo, HttpStatus.OK);   // 200
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(RoomInfo, HttpStatus.BAD_REQUEST);      //400
        }

    }


//    @PostMapping("/saveImage")
//    public String saveImage(@RequestParam("image_url") String imageUrl) throws IOException {
//        // 1. URL에서 이미지 데이터 가져오기
//        URL url = new URL(imageUrl);
//        InputStream inputStream = url.openStream();
//
//        // 2. MultipartFile 객체 생성
//        MultipartFile multipartFile = new MockMultipartFile("file", "image.jpg", "image/jpeg", inputStream);
//
//        // 3. MultipartFile 객체를 서버에 저장
//        File file = new File("이미지 저장 경로");
//        multipartFile.transferTo(file);
//
//        return "이미지가 성공적으로 저장되었습니다.";
//    }


    // 방 생성하는 메서드
    @PostMapping("/room")
    public String write(RoomDto roomDto, MultipartFile file, HttpSession session, HttpServletRequest request,Model m,RedirectAttributes rattr) throws Exception {

        String writer = (String) session.getAttribute("id");

        String path = "/upload";    // 저장할 경로지정
        String filename = null;
        String savePath = request.getServletContext().getRealPath("/resources" + path);
        String imageUrl = "https://picsum.photos/150/150";
        System.out.println(savePath);
        UUID uuid = UUID.randomUUID();      // 파일 이름앞에 붙일 랜덤 이름 생성
        System.out.println(file);
        File saveFile = null;
        if (file.isEmpty()) {
            filename = uuid + "_" +(int)(Math.random()*100)+".jpg";
            saveFile = new File(savePath, filename);               // 파일 넣어줄 껍데기 만들고 경로 , 이름 생성
            URL url = new URL(imageUrl);
            System.out.println(url);
            BufferedImage image = ImageIO.read(url);
            ImageIO.write(image,"jpg",saveFile);
        } else {
            filename = uuid + "_" + file.getOriginalFilename();
            saveFile = new File(savePath, filename);               // 파일 넣어줄 껍데기 만들고 경로 , 이름 생성
            file.transferTo(saveFile);
        }
        System.out.println(saveFile);

        String filepath = path + "/" + filename;


        roomDto.setFilename(filename);
        roomDto.setFilepath(filepath);
        System.out.println(filepath);


        roomDto.setWriter(writer);
        System.out.println(roomDto);

        try {
            if (service.write(roomDto) != 1)
                throw new Exception("Write failed. ");

            rattr.addFlashAttribute("msg","WRT_OK");


        } catch (Exception e) {
            e.printStackTrace();

            rattr.addFlashAttribute("msg","WRT_ERR");

        }
        return "redirect:/room/index";


    }


    // 방을 삭제하는 메서드
    // /comments/1?bno=1085         // 이 bno 는 그냥 쿼리스트링
    // {cno} 이거는 밑에 그냥 쿼리스트링으로 한게 아니고 rest 방식으로 한 url의 일부이므로 @PathVariable 을 붙여준다.
    @DeleteMapping("/rooms/{bno}")       // /comments/1 <-- 삭제할 방 번호
    @ResponseBody
    public ResponseEntity<String> remove(@PathVariable Integer bno, HttpSession session) throws Exception {
        String writer = (String) session.getAttribute("id");

        try {
            int rowCnt = service.remove(bno, writer);

            if (rowCnt != 1)
                throw new Exception("Delete Failed");
            return new ResponseEntity<>("DEL_OK", HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("DEL_ERR", HttpStatus.BAD_REQUEST);
        }
    }

    //  방안에 내용들을 수정하는 메서드
    @PatchMapping("/rooms/{bno}")   // /ch4/comments/bno PATCH
    // CommentDto 그대로 하면 안들어간다! 그래서 앞에 @RequestBody 를 붙여줘야한다
    @ResponseBody
    public ResponseEntity<String> modify(@PathVariable Integer bno, @RequestBody RoomDto ndto, HttpSession session) throws Exception {    // 입력한 내용을 받아와야하니깐 CommentDto dto 해줘야한다.
        String writer = (String) session.getAttribute("id");

        RoomDto dto = service.read(bno);
        ndto.setWriter(writer);
        ndto.setBno(bno);
        ndto.setFilepath(dto.getFilepath());
        ndto.setFilename(dto.getFilename());
        System.out.println("dto = " + dto);

        try {
            if (service.modify(ndto) != 1)
                throw new Exception("Write failed. ");
            return new ResponseEntity<>("MOD_OK", HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("MOD_ERR", HttpStatus.BAD_REQUEST);
        }
    }


    // 모든 방을 가져온다
    @GetMapping("/rooms")
    @ResponseBody
    public ResponseEntity<List<RoomDto>> list() {
        List<RoomDto> list = null;
        try {
            list = service.getList();
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
    @ResponseBody
    public ResponseEntity<List<RoomDto>> listCategory(String category) {
        List<RoomDto> list = null;
        try {
            list = service.readCategoryList(category);
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

