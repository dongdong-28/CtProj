package com.campus.CtProj.service;

import com.campus.CtProj.dao.BoolDao;
import com.campus.CtProj.dao.EnterDao;
import com.campus.CtProj.dao.RoomDao;
import com.campus.CtProj.dao.UserDao;
import com.campus.CtProj.domain.BoolDto;
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
    BoolDao boolDao;


    @Autowired
    RoomInServiceImpl(EnterDao enterDao, RoomDao roomDao,UserDao userDao,BoolDao boolDao) {
        this.enterDao = enterDao;
        this.roomDao = roomDao;
        this.userDao = userDao;
        this.boolDao = boolDao;
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
        boolDao.deleteAll(room_bno);
        return roomDao.delete(room_bno, writer);
    }

    // 멤버가 방 나가기
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int removeMem(Integer room_bno, String user_id) throws Exception {
        RoomDto dto = roomDao.select(room_bno);
        EnterDto enterDto = new EnterDto(user_id, room_bno);
        UserDto userdto = userDao.selectUser(user_id);
        BoolDto boolDto = boolDao.select(room_bno,user_id);
        int coin = userdto.getCoin();
        try {
            Integer dtoVal = enterDao.selectBno(enterDto);
            int cnt = dto.getUser_cnt() - 1;
            System.out.println("삭제완료 : " + cnt);
            if (dtoVal == null || cnt == 0)
                throw new Exception(" no enter mem ");
            if (boolDto.getis_coin_return() == 1)
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

    // 모임이 끝나고 실제 참여한 인원들 확인버튼 누르기
    @Override
    public int confirmMem(Integer room_bno, String user_id, Integer isReview,Integer isCoinReturn) throws Exception {
        BoolDto boolDto = boolDao.select(room_bno,user_id);
        System.out.println(boolDto);
        try {
            boolDto.setis_coin_return(isCoinReturn);
            System.out.println(boolDto);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }

        return boolDao.update(boolDto);

    }

    // 방 번호를 읽으면 입장한 인원들을 보여주는 메서드
    @Override
    public List<String> readMemId(Integer room_bno) throws Exception {
        return  enterDao.selectRoomId(room_bno);
    }



    // 방 번호를 읽으면 입장한 인원들을 보여주는 메서드
    @Override
    public List<BoolDto> readReviewUser(Integer room_bno) throws Exception {
        return  boolDao.selectRoomId(room_bno);
    }




    }
