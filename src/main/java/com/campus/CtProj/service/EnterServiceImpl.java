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

import java.util.List;
import java.util.Objects;

@Service
public class EnterServiceImpl implements EnterService {
    EnterDao enterDao;
    RoomDao roomDao;
    UserDao userDao;
    BoolDao boolDao;

    @Autowired
    EnterServiceImpl(EnterDao enterDao, RoomDao roomDao, UserDao userDao, BoolDao boolDao) {
        this.enterDao = enterDao;
        this.roomDao = roomDao;
        this.userDao = userDao;
        this.boolDao = boolDao;
    }

    @Override
    public int getCount(String user_id) throws Exception {
        return enterDao.countId(user_id);
    }


//    // 멤버가 방 나가기
//    @Override
//    @Transactional(rollbackFor = Exception.class)
//    public int removeMem(Integer room_bno, String user_id) throws Exception {
//        RoomDto dto = roomDao.select(room_bno);
//        EnterDto enterDto = new EnterDto(user_id, room_bno);
//        UserDto userdto = userDao.selectUser(user_id);
//        int coin = userdto.getCoin() +2;
//        try {
//            Integer dtoVal = enterDao.selectBno(enterDto);
//            int cnt = dto.getUser_cnt() - 1;
//            System.out.println("삭제완료 : " + cnt);
//
//            if (dtoVal == null || cnt == 0)
//                throw new Exception(" no enter mem ");
//            userdto.setCoin(coin);
//            dto.setUser_cnt(cnt);
//            userDao.updateUser(userdto);
//            roomDao.update(dto);
//            return enterDao.delete(room_bno, user_id);
//        } catch (Exception e) {
//            e.printStackTrace();
//            return 0;
//        }
//
//    }

    // 강퇴하기
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int dropOut(Integer room_bno, String user_id, Integer drop_num) throws Exception {
        RoomDto dto = roomDao.select(room_bno);
        EnterDto enterDto = new EnterDto(user_id, room_bno);
        try {
            Integer dtoVal = enterDao.selectBno(enterDto);
            int cnt = dto.getUser_cnt() - drop_num;
            System.out.println("삭제완료 : " + cnt);

            if (dtoVal == null || cnt == 0)
                throw new Exception(" no enter mem ");
            dto.setUser_cnt(cnt);
            roomDao.update(dto);
            return enterDao.delete(room_bno, user_id);
        } catch (Exception e) {
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
        UserDto userdto = userDao.selectUser(dto.getUser_id());
        BoolDto boolDto = new BoolDto(dto.getUser_id(),dto.getRoom_bno());
        System.out.println("roomdto11 = " + roomdto);
        int cnt = roomdto.getUser_cnt() + 1;
        int coin = userdto.getCoin() -2;
        System.out.println(coin);

        try {
            Integer dtoVal = enterDao.selectBno(dto);
            if (dtoVal != null || dto.getUser_id().equals(roomdto.getWriter()))              // 이미 입장한 방일 경우
                throw new Exception("already used");
            if (cnt > roomdto.getUser_limit())                                                  // 최대인원인데 입장하려는 경우
                throw new Exception("over user_limit");
            if (coin < 0)                                                                    // 코인이 부족한경우
                throw new Exception("no coin");
            roomdto.setUser_cnt(cnt);
            userdto.setCoin(coin);
            userDao.updateUser(userdto);
            roomDao.update(roomdto);
            boolDao.insert(boolDto);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }

        return enterDao.insert(dto);
    }

    @Override
    public List<String> selectRoomId(Integer room_bno) throws Exception {
        return enterDao.selectRoomId(room_bno);
    }

}