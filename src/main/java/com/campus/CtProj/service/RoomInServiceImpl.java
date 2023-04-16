package com.campus.CtProj.service;

import com.campus.CtProj.dao.EnterDao;
import com.campus.CtProj.dao.RoomDao;
import com.campus.CtProj.dao.UserDao;
import com.campus.CtProj.domain.EnterDto;
import com.campus.CtProj.domain.RoomDto;
import com.campus.CtProj.domain.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class RoomInServiceImpl implements RoomInService {
    EnterDao enterDao;
    RoomDao roomDao;
    UserDao userDao;

    @Autowired
    RoomInServiceImpl(EnterDao enterDao, RoomDao roomDao,UserDao userDao) {
        this.enterDao = enterDao;
        this.roomDao = roomDao;
        this.userDao = userDao;
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


    // 호스트가 방나가기
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int removeHost(Integer room_bno, String writer) throws Exception {
        enterDao.deleteAll(room_bno);
        return roomDao.delete(room_bno, writer);
    }

    // 멤버가 방 나가기
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int removeMem(Integer room_bno, String user_id) throws Exception {
        RoomDto dto = roomDao.select(room_bno);
        EnterDto enterDto = new EnterDto(user_id, room_bno);
        UserDto userdto = userDao.selectUser(user_id);
        Date date = new Date();
        long leftTime = dto.getMeet_Date().getTime()-date.getTime();
        long leftTimeHour = leftTime /(1000*60*60);
        int coin = userdto.getCoin();
        try {
            Integer dtoVal = enterDao.selectBno(enterDto);
            int cnt = dto.getUser_cnt() - 1;
            System.out.println("삭제완료 : " + cnt);
            if (dtoVal == null || cnt == 0)
                throw new Exception(" no enter mem ");
            if (leftTimeHour > 1)                           // 2시간 이전에 나가야만 다시 환급 가능
                coin += 2;

            userdto.setCoin(coin);
            dto.setUser_cnt(cnt);
            userDao.updateUser(userdto);
            roomDao.update(dto);
            return enterDao.delete(room_bno, user_id);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }

    }

    // 방 번호를 읽으면 입장한 인원들을 보여주는 메서드
    @Override
    @Transactional(rollbackFor = Exception.class)
    public List<String> readMemId(Integer room_bno) throws Exception {
        return  enterDao.selectRoomId(room_bno);
    }


    }
