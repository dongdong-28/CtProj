package com.campus.CtProj.controller;

import com.campus.CtProj.domain.RoomDto;
import com.campus.CtProj.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/room")
public class CommonController {
    RoomService roomService;
    EnterService enterService;
    RoomListService roomListService;

    CommonController() {}

    @Autowired
    CommonController(RoomService roomService,EnterService enterService,RoomListService roomListService) {
        this.roomService = roomService;
        this.enterService = enterService;
        this.roomListService = roomListService;
    }



    // 방 생성 페이지 이동
    @GetMapping("/make")
    public String ViewMake(HttpServletRequest request) {
        if(!loginCheck(request))
            return "redirect:/login/login?toURL="+request.getRequestURL();  // 로그인을 안했으면 로그인 화면으로 이동
        return "roomMake";
    }



    // 로그인전 방 입장시에는 로그인 화면 + 최초 로그인 후 방 입장을 누르면 방 찾기로 이동
    @GetMapping("/in-mem")
    public String ViewEnter(HttpServletRequest request,HttpSession session) throws Exception{
        String user_id = (String)session.getAttribute("id");
        if(!loginCheck(request))
            return "redirect:/login/login?toURL="+request.getRequestURL();  // 로그인을 안했으면 로그인 화면으로 이동
        if(roomListService.getCount(user_id) == 0)
            return "roomFind";
        return "roomList";
    }

    // 방 찾기 페이지 이동
    @GetMapping("/find")
    public String ViewFind(HttpServletRequest request) {
        if(!loginCheck(request))
            return "redirect:/login/login?toURL="+request.getRequestURL();  // 로그인을 안했으면 로그인 화면으로 이동
        return "roomFind";
    }


    // 나의방 페이지 이동
    @GetMapping("/list")
    public String ViewList(HttpServletRequest request) {
        if(!loginCheck(request))
            return "redirect:/login/login?toURL="+request.getRequestURL();  // 로그인을 안했으면 로그인 화면으로 이동

        return "roomList";
    }

    // 나의방 페이지에서 입장하면 방 입장으로 이동 (회원일때)
    @PostMapping("/in-mem")
    public String ViewInMem(Model m,HttpSession session, HttpServletRequest request) throws Exception {
//        String user_id = (String)session.getAttribute("id");
        Integer room_bno = Integer.parseInt(request.getParameter("room_num"));
        RoomDto roomDto = roomService.read(room_bno);
        List<String> list = enterService.selectRoomId(room_bno);

        m.addAttribute("list",list);
        m.addAttribute("roomDto",roomDto);    // view 로 넘기기
        if(!loginCheck(request))
            return "redirect:/login/login?toURL="+request.getRequestURL();
        return "roomEnterMem";
    }

    // 나의방 페이지에서 입장하면 방 입장으로 이동 (방장일때)
    @PostMapping("/in-host")
    public String ViewInHost(Model m, HttpServletRequest request) throws Exception {
        Integer room_bno = Integer.parseInt(request.getParameter("room_num"));
        RoomDto roomDto = roomService.read(room_bno);
        List<String> list = enterService.selectRoomId(room_bno);

        m.addAttribute("roomDto",roomDto);    // view 로 넘기기
        m.addAttribute("list",list);
        if(!loginCheck(request))
            return "redirect:/login/login?toURL="+request.getRequestURL();  // 로그인을 안했으면 로그인 화면으로 이동
        return "roomEnter_host";
    }

    // 방장이 방안에서 변경사항 변경하기
    @PostMapping("/in-host-mod")
    public String ModHost(Model m, HttpServletRequest request) throws Exception {
        Integer room_bno = Integer.parseInt(request.getParameter("room_num"));
        RoomDto roomDto = roomService.read(room_bno);
        List<String> list = enterService.selectRoomId(room_bno);
        if(roomService.modify(roomDto) != 1){
            System.out.println("변경안됨.. ㅋㅋ ");
            return "roomEnter_host";
        }
        m.addAttribute("roomDto",roomDto);    // view 로 넘기기
        m.addAttribute("list",list);
        if(!loginCheck(request))
            return "redirect:/login/login?toURL="+request.getRequestURL();  // 로그인을 안했으면 로그인 화면으로 이동
        System.out.println("변경완료인데..?");
        return "roomEnter_host";
    }

    // 방 생성하는 메서드
//    @ResponseBody
    @PostMapping("/in-test")
    public String write(MultipartFile file,HttpSession session) throws Exception {    // 입력한 내용을 받아와야하니깐 CommentDto dto 해줘야한다.

        RoomDto roomDto = null;
        System.out.println("dto = " + roomDto);
        System.out.println("fil = " + file);
        String writer = (String)session.getAttribute("id");

        roomDto.setWriter(writer);

        System.out.println("dto = " + roomDto);
        System.out.println("fil = " + file);

        try {
            if(roomService.write(roomDto,file) != 1)
                throw new Exception("Write failed. ");

            return "index";

        } catch (Exception e) {
            e.printStackTrace();
            return "roomFind";
        }
    }


    // 홈에서 카테고리선택에 따른 방 찾기 .. 카테고리선택을 방 찾기 페이지로 넘기기 위한..!
    @GetMapping("/find/category")
    public String MainToCategory(Model m, HttpServletRequest request) throws Exception {
        String category = request.getParameter("category");
        m.addAttribute("maintocate",category);
        return "roomFind";
    }




    private boolean loginCheck(HttpServletRequest request) {
        // 1. 세션을 얻어서
        HttpSession session = request.getSession();
        // 2. 세션에 id가 있는지 확인, 있으면 true를 반환
        return session.getAttribute("id")!=null;
    }



    }
