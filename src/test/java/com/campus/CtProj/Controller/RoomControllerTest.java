//package com.campus.CtProj.Controller;
//
//import com.campus.CtProj.dao.RoomDao;
//import com.campus.CtProj.domain.RoomDto;
//import com.campus.CtProj.service.RoomService;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//
//import static org.junit.Assert.*;
//
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
//public class RoomControllerTest {
//
//    @Autowired
//    RoomService service;
//    @Autowired
//    RoomDao roomDao;
//
//    @Test
//    public void write() {
//    }
//
//    @Test
//    public void remove() throws Exception {
//        RoomDto roomDto = roomDao.select(41,"17100123");
//        assertTrue(service.remove(roomDto.getBno(), roomDto.getWriter()) == 1);
//
//    }
//
//    @Test
//    public void list() {
//    }
//}