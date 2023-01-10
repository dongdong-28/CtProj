package com.campus.CtProj.service;

import com.campus.CtProj.dao.EnterDao;
import com.campus.CtProj.dao.RoomDao;
import com.campus.CtProj.domain.EnterDto;
import com.campus.CtProj.domain.RoomDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Objects;

@Service
public class EnterServiceImpl implements EnterService {
    EnterDao enterDao;
    RoomDao roomDao;

    @Autowired
    EnterServiceImpl(EnterDao enterDao, RoomDao roomDao) {
        this.enterDao = enterDao;
        this.roomDao = roomDao;
    }

    @Override
    public int getCount(String user_id) throws Exception {
        return enterDao.countId(user_id);
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public int remove(Integer room_bno, String user_id) throws Exception {
        RoomDto dto = roomDao.select(room_bno);
        EnterDto enterDto = new EnterDto(user_id,room_bno);
        try {
            Integer dtoVal = enterDao.selectBno(enterDto);
            int cnt =  dto.getUser_cnt()-1;

            if(dtoVal == null || cnt == 0)
                throw new Exception(" no enter mem ");
            dto.setUser_cnt(cnt);
            roomDao.update(dto);
            return enterDao.delete(room_bno, user_id);
        }
        catch (Exception e) {
            e.printStackTrace();
            return 0;
        }

    }


    @Override
    public List<EnterDto> getList() throws Exception {
        return enterDao.selectAll();
    }

//    @Override
//    public List<EnterDto> read(String user_id) throws Exception {
//        return enterDao.select(user_id);
//    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Integer enter(EnterDto dto) throws Exception {
        RoomDto roomdto = roomDao.select(dto.getRoom_bno());

        try {
            Integer dtoVal = enterDao.selectBno(dto);
            int cnt =   roomdto.getUser_cnt()+1;
            if(dtoVal != null || dto.getUser_id().equals(roomdto.getWriter()))              // 이미 입장한 방일 경우
                throw new Exception("already used");
         if(cnt > roomdto.getUser_limit())                                                  // 최대인원인데 입장하려는 경우
             throw new Exception("over user_limit");
         roomdto.setUser_cnt(cnt);
        }
        catch (Exception e) {
            e.printStackTrace();
            return 0;
        }

        roomDao.update(roomdto);


        return enterDao.insert(dto);
    }

    @Override
    public List<String> selectRoomId(Integer room_bno) throws Exception {
        return enterDao.selectRoomId(room_bno);
    }

}