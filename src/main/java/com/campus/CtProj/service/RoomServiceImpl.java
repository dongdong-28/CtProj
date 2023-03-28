package com.campus.CtProj.service;


import com.campus.CtProj.dao.RoomDao;
import com.campus.CtProj.dao.EnterDao;
import com.campus.CtProj.domain.RoomDto;
import com.campus.CtProj.domain.SearchCondition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoomServiceImpl implements RoomService {

    RoomDao roomDao;
    EnterDao enterDao;
    @Autowired
    public RoomServiceImpl(RoomDao roomDao, EnterDao enterDao) {
        this.roomDao = roomDao;
        this.enterDao = enterDao;
    }




    @Override       // 방의 수 세기
    public int getCount() throws Exception {
        return roomDao.count();
    }

    @Override       // 방 삭제
    public int remove(Integer bno, String writer) throws Exception {
        return roomDao.delete(bno, writer);
    }


    @Override
    public List<RoomDto> getList() throws Exception {
        return roomDao.selectAll();

    }



    @Override           // 방 생성
    public int write(RoomDto roomDto) throws Exception {
        return roomDao.insert(roomDto);
    }

    @Override       // 방 읽기
    public RoomDto read(Integer bno) throws Exception {

        return roomDao.select(bno);
    }

    // 카테고리별로 방 가져오기
    @Override       // 방 읽기
    public List<RoomDto> readCategoryList(String category) throws Exception {
        List<RoomDto> roomDto = roomDao.selectCategory(category);

        return roomDto;
    }

    @Override           // 방 안에 내용 변경
    public int modify(RoomDto roomDto) throws Exception {
        return roomDao.update(roomDto);
    }
    @Override
    public List<RoomDto> getSearchSelectPage(SearchCondition sc) throws Exception{
        return roomDao.searchSelectPage(sc);
    }

}