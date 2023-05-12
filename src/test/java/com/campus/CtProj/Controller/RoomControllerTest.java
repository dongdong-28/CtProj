package com.campus.CtProj.Controller;

import com.campus.CtProj.dao.EnterDao;
import com.campus.CtProj.dao.RoomDao;
import com.campus.CtProj.domain.EnterDto;
import com.campus.CtProj.domain.PageHandler;
import com.campus.CtProj.domain.RoomDto;
import com.campus.CtProj.service.EnterService;
import com.campus.CtProj.service.RoomService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class RoomControllerTest {

    @Autowired
    RoomService service;
    @Autowired
    RoomDao roomDao;
    @Autowired
    EnterService EntService;
    @Autowired
    EnterDao EnterDao;

//    @Test
//    public void write() {
//        RoomDto dto = roomDao.
//    }

//    @Test
//    public void remove() throws Exception {
//        RoomDto roomDto = roomDao.select(41);
//        assertTrue(service.remove(roomDto.getBno(), roomDto.getWriter()) == 1);

//    }


    @Test
    public void read() throws Exception {
        RoomDto roomDto = service.read(216);
        System.out.println(roomDto);
//        assertTrue(service.read(216)== 1);

    }

    @Test
    public void readPage() throws Exception {
        List<RoomDto> list = null;
        int roomCnt = service.getCount();
        int page = 1;
        System.out.println("roomCnt = " + roomCnt);
        PageHandler ph = new PageHandler(roomCnt, page);
        Map map = new HashMap();
        map.put("offset", (page - 1) * ph.getPageSize());
        map.put("pageSize", ph.getPageSize());

        list = service.getPageList(map);
        System.out.println("cnt = "+list.size());
        System.out.println(list);
    }

//    // 방 생성
//    @Test
//    public void MakeRoom() throws Exception {
//        RoomDto roomDto = roomDao.se
//    }

    // 방 입장
//    @Test
//    public void enter() throws Exception {
//        EnterDto enterDto = new EnterDto("17100999",250);
//        assertTrue(EntService.enter(enterDto)==1);
//    }


}
