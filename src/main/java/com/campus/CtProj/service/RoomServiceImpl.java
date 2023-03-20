package com.campus.CtProj.service;


import com.campus.CtProj.dao.RoomDao;
import com.campus.CtProj.dao.EnterDao;
import com.campus.CtProj.domain.RoomDto;
import com.campus.CtProj.domain.SearchCondition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.List;
import java.util.UUID;

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
    public int write(RoomDto roomDto, MultipartFile file) throws Exception {
        String projectPath ="/Users/pdh_f/IdeaProjects/CtProj/src/main/webapp/resources/upload/img";      // 저장할 경로지정
        UUID uuid = UUID.randomUUID();      // 파일 이름앞에 붙일 랜덤 이름 생성
        String filename = uuid + "_"+file.getOriginalFilename();
        File saveFile = new File(projectPath,filename);               // 파일 넣어줄 껍데기 만들고 경로 , 이름 생성
        file.transferTo(saveFile);
        roomDto.setFilename(filename);
        roomDto.setFilepath("/img/"+filename);

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

//    @Override
//    public List<BoardDto> getPage(Map map) throws Exception {
//        return boardDao.selectPage(map);
//    }

    @Override           // 방 안에 내용 변경
    public int modify(RoomDto roomDto) throws Exception {
        return roomDao.update(roomDto);
    }
    @Override
    public List<RoomDto> getSearchSelectPage(SearchCondition sc) throws Exception{
        return roomDao.searchSelectPage(sc);
    }

}