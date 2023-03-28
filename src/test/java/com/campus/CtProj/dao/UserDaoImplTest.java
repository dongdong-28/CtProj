//package com.campus.CtProj.dao;
//
//import com.campus.CtProj.domain.UserDto;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//
//import java.util.Date;
//
//import static org.junit.Assert.assertTrue;
//
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
//public class UserDaoImplTest {
//    @Autowired
//    private UserDao userDao;
//
//    @Test
//    public void selectUser() throws Exception{
//        UserDto userDto = new UserDto("17100123","4321","잘하고있어!!!!!",300,7,"/asd",new Date(),2);
//        userDao.insertUser(userDto);
//        System.out.println(userDao.selectUser("17100123"));
////        assertTrue(userDao.equals(us));
//
//
//    }
//
//    @Test
//    public void deleteUser() throws Exception{
//        UserDto userDto = new UserDto("17100999","1234","hey",10,5,"/s/s/",new Date(),2);
//        assertTrue(userDao.deleteUser(userDto.getId()) == 1);
//
//    }
//
//    @Test
//    public void insertUser() throws Exception {
//        userDao.deleteAll();
//        UserDto userDto = new UserDto("17100725","1234","할수있어",10,5,"/s/s/",new Date(),2);
//        assertTrue(userDao.insertUser(userDto)==1);
////
////        commentDto = new CommentDto(1, 0, "comment", "asdf");
////        assertTrue(commentDao.insert(commentDto)==1);
////        assertTrue(commentDao.count(1)==2);
//    }
//
//    @Test
//    public void updateUser()throws Exception {
//        userDao.deleteAll();
//        UserDto userDto = new UserDto("17100725","1234","할수있어",10,5,"/s/s/",new Date(),2);
//        userDao.insertUser(userDto);
//        userDto.setNickname("리얼로할수잇어!");
//        userDto.setPassword("4321");
//        userDto.setLevel(7);
//        userDto.setPoint(300);
//        userDto.setImg_profile("/asd");
////        userDto.set("찐할수잇어!");
//        assertTrue(userDao.updateUser(userDto) == 1);
//    }
//
//    @Test
//    public void deleteAll() throws Exception{
//    }
//}