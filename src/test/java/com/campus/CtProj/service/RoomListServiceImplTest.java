package com.campus.CtProj.service;

import com.campus.CtProj.dao.EnterDao;
import com.campus.CtProj.dao.RoomDao;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class RoomListServiceImplTest {
    @Autowired
    RoomListService service;
    @Autowired
    RoomDao roomDao;
    @Autowired
    EnterDao enterDao;

    @Test
    public void getCount()  throws Exception{
        String user_id = "17100725";
        System.out.println(service.getCount(user_id));
        assertTrue(service.getCount(user_id)==1);

    }

    @Test
    public void readMem() {

    }

    @Test
    public void readHost() {
    }
}