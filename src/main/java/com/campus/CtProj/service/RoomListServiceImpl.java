package com.campus.CtProj.service;

import com.campus.CtProj.dao.*;
import com.campus.CtProj.domain.BoolDto;
import com.campus.CtProj.domain.ReviewDto;
import com.campus.CtProj.domain.RoomDto;
import com.campus.CtProj.domain.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class RoomListServiceImpl implements RoomListService {
    EnterDao enterDao;
    RoomDao roomDao;
    BoolDao boolDao;
    UserDao userDao;
    ReviewDao reviewDao;
    @Autowired
    RoomListServiceImpl(EnterDao enterDao, RoomDao roomDao,BoolDao boolDao,UserDao userDao,ReviewDao reviewDao) {
        this.enterDao = enterDao;
        this.roomDao = roomDao;
        this.boolDao = boolDao;
        this.userDao = userDao;
        this.reviewDao = reviewDao;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int getCount(String user_id) throws Exception {
        return  roomDao.countId(user_id)+enterDao.countId(user_id);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int removeReview(Integer room_bno, String user_id) throws Exception {
        UserDto userDto = userDao.selectUser(user_id);
        Integer coin = userDto.getCoin() + 2;
        userDto.setCoin(coin);
        try {
            userDao.updateUser(userDto);
            return boolDao.delete(room_bno,user_id);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

//    @Override
//    @Transactional(rollbackFor = Exception.class)
//    public int removeHost(Integer room_bno, String writer) throws Exception {
//        enterDao.deleteAll(room_bno);
//        return roomDao.delete(room_bno, writer);
//    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public List<RoomDto> readMem(String user_id) throws Exception {
        List<Integer> dto = enterDao.selectRoomBno(user_id);
        return roomDao.selectRoom(dto);
    }

    @Override
    public List<RoomDto> readHost(String user_id) throws Exception {
        return roomDao.selectHostRoom(user_id);
    }

    @Override
    public List<BoolDto> readReviewList(String user_id) throws Exception {
        return boolDao.selectRoomBno(user_id);
    }


    // 방 번호를 읽으면 입장한 인원들을 보여주는 메서드
    @Override
    public List<ReviewDto> readReviewUser(Integer room_bno) throws Exception {
        return reviewDao.selectreviewId(room_bno);
    }


}