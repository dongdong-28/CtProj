package com.campus.CtProj.service;

import com.campus.CtProj.dao.EnterDao;
import com.campus.CtProj.dao.RoomDao;
import com.campus.CtProj.domain.RoomDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class RoomInServiceImpl implements RoomInService {
    EnterDao enterDao;
    RoomDao roomDao;

    @Autowired
    RoomInServiceImpl(EnterDao enterDao, RoomDao roomDao) {
        this.enterDao = enterDao;
        this.roomDao = roomDao;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int getCount(String user_id) throws Exception {
        return  roomDao.countId(user_id)+enterDao.countId(user_id);
    }

    // 입장한 방의 정보를 알려주는 메서드
    @Override
    public RoomDto read(int room_bno) throws Exception {
        return roomDao.select(room_bno);
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public int leaveHost(Integer room_bno, String writer) throws Exception {
        enterDao.deleteAll(room_bno);
        return roomDao.delete(room_bno, writer);    }

    // 방 번호를 읽으면 입장한 인원들을 보여주는 메서드
    @Override
    @Transactional(rollbackFor = Exception.class)
    public List<String> readMemId(Integer room_bno) throws Exception {
        return  enterDao.selectRoomId(room_bno);
    }


    }
