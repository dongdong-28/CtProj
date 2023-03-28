package com.campus.CtProj.service;

import com.campus.CtProj.domain.RoomDto;
import com.campus.CtProj.domain.SearchCondition;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface RoomService {
    // 방의 수 세기
    int getCount() throws Exception;


    // 방 삭제
    int remove(Integer bno, String writer) throws Exception;

    // 방 생성
    int write(RoomDto roomDto) throws Exception;

    // 방 읽기
    RoomDto read(Integer bno) throws Exception;


    // 방 전부 읽기
    List<RoomDto> getList() throws Exception;


    // 카테고리별로 방 읽기
    List<RoomDto> readCategoryList(String category) throws Exception;

    // 방 안에 내용 변경
    int modify(RoomDto roomDto) throws Exception;

    // 검색으로 방 읽기
     List<RoomDto> getSearchSelectPage(SearchCondition sc) throws Exception;

    }
