package com.campus.CtProj.service;

import com.campus.CtProj.dao.EnterDao;
import com.campus.CtProj.dao.RoomDao;
import com.campus.CtProj.domain.RoomDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class RoomListServiceImpl implements RoomListService {
    EnterDao enterDao;
    RoomDao roomDao;

    @Autowired
    RoomListServiceImpl(EnterDao enterDao, RoomDao roomDao) {
        this.enterDao = enterDao;
        this.roomDao = roomDao;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int getCount(String user_id) throws Exception {
        return  roomDao.countId(user_id)+enterDao.countId(user_id);
    }

    @Override
    public int removeMem(Integer room_bno, String user_id) throws Exception {
        return enterDao.delete(room_bno, user_id);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int removeHost(Integer room_bno, String writer) throws Exception {
        enterDao.deleteAll(room_bno);
        return roomDao.delete(room_bno, writer);
    }


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



}