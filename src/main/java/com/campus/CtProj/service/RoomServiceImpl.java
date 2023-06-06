package com.campus.CtProj.service;


import com.campus.CtProj.dao.*;
import com.campus.CtProj.domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
public class RoomServiceImpl implements RoomService {

    RoomDao roomDao;
    EnterDao enterDao;
    UserDao userDao;
    BoolDao boolDao;
    @Autowired
    public RoomServiceImpl(RoomDao roomDao, EnterDao enterDao,UserDao userDao, BoolDao boolDao) {
        this.roomDao = roomDao;
        this.enterDao = enterDao;
        this.userDao = userDao;
        this.boolDao = boolDao;


    }




    @Override       // 방의 수 세기
    public int getCount() throws Exception {
        return roomDao.count();
    }

    @Override       // 방 삭제
    public int remove(Integer bno) throws Exception {
        return roomDao.delete(bno);
    }


    @Override
    public List<RoomDto> getList() throws Exception {
        return roomDao.selectAll();

    }
    @Override
    public List<RoomDto> getPageList(Map map) throws Exception {
        return roomDao.selectPage(map);

    }




    @Override           // 방 생성
    @Transactional(rollbackFor = Exception.class)
    public int write(RoomDto roomDto) throws Exception {
        UserDto userdto = userDao.selectUser(roomDto.getWriter());
        int coin = userdto.getCoin() -2;
        try{
            if(coin <0)
                throw new Exception("no Coin");
            userdto.setCoin(coin);
            userDao.updateUser(userdto);
            roomDto.setNickname(userdto.getNickname());
            roomDto.setWri_level(userdto.getLevel());

            roomDao.insert(roomDto);
        } catch(Exception e){
            e.printStackTrace();
            return 0;
        }
        //  작성자도 user_bool 에 추가될 수 있게 만들기 위해서
        List<RoomDto> hostList = roomDao.selectHostRoom(roomDto.getWriter());
        RoomDto dto = hostList.get(hostList.size()-1);
        BoolDto boolDto = new BoolDto(dto.getWriter(),dto.getBno());
        return boolDao.insert(boolDto);
    }

    @Override       // 방 읽기
    public RoomDto read(Integer bno) throws Exception {

        return roomDao.select(bno);
    }

    // 카테고리별로 방 가져오기
    @Override
    public List<RoomDto> readCategoryList(String category) throws Exception {

        return roomDao.selectCategory(category);
    }

    @Override           // 방 안에 내용 변경
    public int modify(RoomDto roomDto) throws Exception {
        UserDto userDto = userDao.selectUser(roomDto.getWriter());
        roomDto.setNickname(userDto.getNickname());
        roomDto.setWri_level(userDto.getLevel());
        return roomDao.update(roomDto);
    }

    @Override       // 나갈때 후기 생성할지 안할지
    public BoolDto selectReview(Integer roomBno,String userId) throws Exception {
       return boolDao.select(roomBno,userId);

    }

    @Override
    public List<RoomDto> getSearchSelectPage(SearchCondition sc) throws Exception{
        return roomDao.searchSelectPage(sc);
    }


}