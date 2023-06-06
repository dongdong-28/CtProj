package com.campus.CtProj.controller;
import com.campus.CtProj.domain.BoolDto;
import com.campus.CtProj.domain.PageHandler;
import com.campus.CtProj.domain.RoomDto;
import com.campus.CtProj.domain.SearchCondition;
import com.campus.CtProj.service.RoomService;
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

@Controller
public class RoomController {
    RoomService roomService;

    @Autowired
    public RoomController(RoomService roomService) {
        this.roomService = roomService;
    }

    // 방 읽기
    @GetMapping("/room")
    @ResponseBody
    public ResponseEntity<RoomDto> read(HttpServletRequest request) throws Exception {

        RoomDto RoomInfo = null;
        Integer bno = Integer.parseInt(request.getParameter("bno"));
        try {
            RoomInfo = roomService.read(bno);
            return new ResponseEntity<>(RoomInfo, HttpStatus.OK);   // 200
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(RoomInfo, HttpStatus.BAD_REQUEST);      //400
        }

    }



    // 방 생성하는 메서드
    @PostMapping("/room")
    public String write(RoomDto roomDto, MultipartFile file, HttpSession session, HttpServletRequest request, Model m, RedirectAttributes rattr) throws Exception {

        String writer = (String) session.getAttribute("id");

        String path = "/upload";    // 저장할 경로지정
        String filename = null;
        String savePath = request.getServletContext().getRealPath("/resources" + path);
        String imageUrl = "https://picsum.photos/500/400";
        UUID uuid = UUID.randomUUID();      // 파일 이름앞에 붙일 랜덤 이름 생성
        File saveFile = null;
        if (file.isEmpty()) {
            filename = uuid + "_" +(int)(Math.random()*100)+".jpg";
            saveFile = new File(savePath, filename);               // 파일 넣어줄 껍데기 만들고 경로 , 이름 생성
            URL url = new URL(imageUrl);
            ImageIO.setUseCache(false);
            BufferedImage image = ImageIO.read(url);
            ImageIO.write(image,"jpg",saveFile);
        } else {
            filename = uuid + "_" + file.getOriginalFilename();
            saveFile = new File(savePath, filename);               // 파일 넣어줄 껍데기 만들고 경로 , 이름 생성
            file.transferTo(saveFile);
        }

        String filepath = path + "/" + filename;


        roomDto.setFilename(filename);
        roomDto.setFilepath(filepath);


        roomDto.setWriter(writer);

        try {
            if (roomService.write(roomDto) != 1)
                throw new Exception("Write failed. ");
            rattr.addFlashAttribute("msg","WRT_OK");

        } catch (Exception e) {
            e.printStackTrace();

            rattr.addFlashAttribute("msg","WRT_ERR");

        }
        return "redirect:/room/index";


    }


    // 확인 전에 방을 삭제하는 메서드
    // /comments/1?bno=1085         // 이 bno 는 그냥 쿼리스트링
    // {cno} 이거는 밑에 그냥 쿼리스트링으로 한게 아니고 rest 방식으로 한 url의 일부이므로 @PathVariable 을 붙여준다.
    @DeleteMapping("/rooms/{bno}")       // /comments/1 <-- 삭제할 방 번호
    @ResponseBody
    public ResponseEntity<String> remove(@PathVariable Integer bno, HttpSession session) throws Exception {
        String writer = (String) session.getAttribute("id");

        try {
            int rowCnt = roomService.remove(bno);

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
    public ResponseEntity<String> modify(@PathVariable Integer bno, @RequestBody RoomDto roomDto, HttpSession session) throws Exception {    // 입력한 내용을 받아와야하니깐 CommentDto dto 해줘야한다.
        String writer = (String) session.getAttribute("id");

        RoomDto dto = roomService.read(bno);
        roomDto.setWriter(writer);
        roomDto.setBno(bno);
        roomDto.setFilepath(dto.getFilepath());
        roomDto.setFilename(dto.getFilename());

        try {
            if (roomService.modify(roomDto) != 1)
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
            list = roomService.getList();
            // return 으로 그냥 list 를 보내는 것이 아니라 ResponseEntity<List<CommentDto>>(list, HttpStatus.OK) 를 쓴 이유는
            // 그냥 list 로 보내면 오류가 나도 응답은 200번대로 나온다 그래서 responseEntity를 사용해서 list 에다가 + 상태코드도 같이 보내주게 한다.
            return new ResponseEntity<List<RoomDto>>(list, HttpStatus.OK);   // 200
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<List<RoomDto>>(list, HttpStatus.BAD_REQUEST);      //400
        }

    }


    // 모든 방을 가져온다
    @GetMapping("/rooms/list")
    @ResponseBody
    public ResponseEntity<List<RoomDto>> list(Integer page) throws Exception {
        List<RoomDto> list = null;
        int roomCnt = roomService.getCount();
        if(page == null) page = 1;
        try {
            PageHandler ph = new PageHandler(roomCnt,page);
            Map map = new HashMap();
            map.put("offset",(page-1)*ph.getPageSize());
            map.put("pageSize",ph.getPageSize());
            list = roomService.getPageList(map);

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
            list = roomService.readCategoryList(category);
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
            list = roomService.getSearchSelectPage(sc);
            return new ResponseEntity<List<RoomDto>>(list, HttpStatus.OK);   // 200
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<List<RoomDto>>(list, HttpStatus.BAD_REQUEST);      //400
        }
    }


    // 후기 기능 켤지 안켤지 확인하기
    @GetMapping("/room/review")
    public ResponseEntity<BoolDto> userReview(HttpServletRequest request, HttpSession session) throws Exception {
        Integer roomBno = Integer.parseInt(request.getParameter("bno"));
        String userName = (String) session.getAttribute("id");
        BoolDto boolDto = null;
        try {
            boolDto = roomService.selectReview(roomBno,userName);
            return new ResponseEntity<BoolDto>(boolDto, HttpStatus.OK);   // 200
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<BoolDto>(boolDto, HttpStatus.BAD_REQUEST);      //400
        }
    }


}

