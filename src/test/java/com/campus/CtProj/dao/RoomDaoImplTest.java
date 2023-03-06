package com.campus.CtProj.dao;

import com.campus.CtProj.domain.BoardDto;
import com.campus.CtProj.domain.EnterDto;
import com.campus.CtProj.domain.RoomDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import static org.junit.Assert.*;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class RoomDaoImplTest {

    @Autowired
    RoomDao roomDao;

    @Autowired
    EnterDao enterDao;

    @Test
    public void count() throws Exception{
        System.out.println(roomDao.count());

    }

    @Test
    public void countId() throws Exception {
        System.out.println(roomDao.countId("7100725"));
    }



//    @Test
//    public void selectRoom() throws Exception {
//
//    RoomDto dto = roomDao.select(127);
//
//        System.out.println(dto.getMeet_Date());
//
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
////SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.sss");  //<--millisecond는 "sss"가 아니라 "SSS"로 해야 정확하게 보존된다.
//
//        long timeInMillis =System.currentTimeMillis();
//        System.out.println(timeInMillis);166898880000
//
//
//        Date timeInDate = new Date(166898880000);
//        String timeInFormat = sdf.format(timeInDate);
//        System.out.println(timeInFormat);
//
//
//    }




//    @Test
//    public void delete() throws Exception {
//        RoomDto roomDto = roomDao.select(59,"17100999");
//        assertTrue(roomDao.delete(roomDto.getBno(), roomDto.getWriter()) == 1);
//
//    }
//
//    @Test
//    public void insert() throws  Exception{
//        RoomDto roomDto = new RoomDto("같이 놀사람!", "/pic", "공릉동", "꼭참석해야해요", "취미","17100721", 6);
//        assertTrue(roomDao.insert(roomDto)==1);
//
////        boardDto = new BoardDto("no title", "no content", "asdf");
////        assertTrue(boardDao.insert(boardDto)==1);
////        assertTrue(boardDao.count()==2);
////
////        boardDao.deleteAll();
////        boardDto = new BoardDto("no title", "no content", "asdf");
////        assertTrue(boardDao.insert(boardDto)==1);
////        assertTrue(boardDao.count()==1);
//    }
//
//    @Test
//    public void select()throws Exception {
//        RoomDto roomDto = new RoomDto("같이 놀사람!", "/pic", "노원구", "꼭참석해야해요", "취미","17100999", 6);
//        roomDao.insert(roomDto);
//        RoomDto roomDto2 = roomDao.select(59,"17100725");
//        System.out.println(roomDto2.getMeet_place());
//        System.out.println(roomDto.getMeet_place());
//        assertTrue(roomDto.getMeet_place().equals(roomDto2.getMeet_place()));
//
//    }
//
    @Test
    public void update() throws Exception {
        RoomDto roomDto = roomDao.select(161);
        System.out.println(roomDto.getNotice());
        roomDto.setMeet_place("서초");
        roomDto.setNotice("진짜 다 바꼈네ㅋㅋㅋ ");
        assertTrue(roomDao.update(roomDto) == 1);
    }
}