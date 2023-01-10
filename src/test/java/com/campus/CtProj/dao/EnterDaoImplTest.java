package com.campus.CtProj.dao;

import com.campus.CtProj.domain.EnterDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class EnterDaoImplTest {
    @Autowired
    EnterDao enterDao;

    @Test
    public void countId() throws Exception {
        EnterDto dto = new EnterDto("17100725",75);
        System.out.println(enterDao.countId("17100123"));
//        assertTrue(userNumDao.countId("17100725") ==1);

    }

    @Test
    public void delete() {
    }

    @Test
    public void insert() throws Exception {
        EnterDto dto = new EnterDto("17100725",2);
        assertTrue(enterDao.insert(dto) == 1);

    }

    @Test
    public void selectAll() {
    }

    @Test
    public void selectRoomBno() throws Exception{


                for(Integer n : enterDao.selectRoomBno("17100123")) {

                    System.out.println(n);

                }


    }
}