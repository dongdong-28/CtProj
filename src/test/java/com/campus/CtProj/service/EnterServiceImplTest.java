package com.campus.CtProj.service;

import com.campus.CtProj.dao.EnterDao;
import com.campus.CtProj.domain.EnterDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class EnterServiceImplTest {

    @Autowired
    EnterService service;

    @Autowired
    EnterDao dao;

    @Test
    public void getCount() {
    }

    @Test
    public void remove() throws Exception{


        assertTrue(service.removeMem(219,"17100123") == 1);

    }

    @Test
    public void getList() {
    }

    @Test
    public void enter() throws Exception {
        EnterDto dto = new EnterDto("17100456",246);

        assertTrue(service.enter(dto) == 1);
    }
}