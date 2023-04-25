package com.campus.CtProj.service;

import com.campus.CtProj.dao.*;
import com.campus.CtProj.domain.*;
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
    ReviewDao reviewDao;


    @Autowired
    RoomInServiceImpl(EnterDao enterDao, RoomDao roomDao, UserDao userDao, BoolDao boolDao,ReviewDao reviewDao) {
        this.enterDao = enterDao;
        this.roomDao = roomDao;
        this.userDao = userDao;
        this.boolDao = boolDao;
        this.reviewDao = reviewDao;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int getCount(String user_id) throws Exception {
        return roomDao.countId(user_id) + enterDao.countId(user_id);
    }

    // 입장한 방의 정보를 알려주는 메서드
    @Override
    public RoomDto read(int room_bno) throws Exception {
        return roomDao.select(room_bno);
    }


    // 호스트가 방나가기 (확인전일 때)
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int removeHost(Integer room_bno) throws Exception {
        enterDao.deleteAll(room_bno);
        boolDao.deleteAll(room_bno);
        return roomDao.delete(room_bno);
    }

    // 멤버가 방 나가기
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int removeMem(Integer room_bno, String user_id) throws Exception {
        RoomDto dto = roomDao.select(room_bno);
        EnterDto enterDto = new EnterDto(user_id, room_bno);
//        UserDto userdto = userDao.selectUser(user_id);
//        BoolDto boolDto = boolDao.select(room_bno, user_id);
//        int coin = userdto.getCoin();
        try {
            Integer dtoVal = enterDao.selectBno(enterDto);
            int cnt = dto.getUser_cnt() - 1;
            System.out.println("삭제완료 : " + cnt);
            if (dtoVal == null || cnt == 0)
                throw new Exception(" no enter mem ");
//            if (boolDto.getis_coin_return() == 1)
//                coin += 2;
//            userdto.setCoin(coin);
            dto.setUser_cnt(cnt);
//            userDao.updateUser(userdto);
            roomDao.update(dto);
            return enterDao.delete(room_bno, user_id);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }

    }

    // 모임이 끝나고 실제 참여한 인원들 확인버튼 누르기
    @Override
    public int confirmMem(Integer room_bno, String user_id, Integer isCoinReturn) throws Exception {
        BoolDto boolDto = boolDao.select(room_bno, user_id);
        RoomDto roomDto = roomDao.select(room_bno);
        System.out.println(boolDto);
        try {
            boolDto.setIs_coin_return(isCoinReturn);
            boolDto.setReview_title(roomDto.getTitle());
            boolDto.setReview_date(roomDto.getMeet_Date());
            boolDto.setReview_place(roomDto.getMeet_place());
            System.out.println(boolDto);

        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }

        return boolDao.update(boolDto);

    }

    // 호스트가 방나가기 (확인 후일 때)
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int removeHostAterConfirm(Integer room_bno) throws Exception {
       List<BoolDto> boolList = boolDao.selectRoomId(room_bno);
       for(int i =0; i<boolList.size();i++) {
           if(boolList.get(i).getIs_coin_return() == 0)
               boolDao.delete(room_bno,boolList.get(i).getUser_id());
       }
        enterDao.deleteAll(room_bno);
        return roomDao.delete(room_bno);
    }


    // 확인버튼 후에 레벨 바꾸기
    @Override
    public int modifyMemLevel(String user_id, Integer reviewPoint) throws Exception {
        UserDto userDto = userDao.selectUser(user_id);
        double reveiwPointFormat = 0;

        switch (reviewPoint) {
            case 1:
                reveiwPointFormat = userDto.getLevel() - 0.3;
                break;
            case 2:
                reveiwPointFormat = userDto.getLevel() - 0.2;
                break;
            case 3:
                reveiwPointFormat = userDto.getLevel();
                break;
            case 4:
                reveiwPointFormat = userDto.getLevel() + 0.2;
                break;
            case 5:
                reveiwPointFormat = userDto.getLevel() + 0.3;
                break;
        }

        try{
            userDto.setLevel(reveiwPointFormat);
            } catch (Exception e) {
                e.printStackTrace();
                return 0;
            }

        return userDao.updateUser(userDto);

    }

    // 방 번호를 읽으면 입장한 인원들을 보여주는 메서드
    @Override
    public List<String> readMemId(Integer room_bno) throws Exception {
        return enterDao.selectRoomId(room_bno);
    }


    // 방 번호를 읽으면 입장한 인원들을 보여주는 메서드
    @Override
    public List<BoolDto> readReviewUser(Integer room_bno) throws Exception {
        return boolDao.selectRoomId(room_bno);
    }


}
