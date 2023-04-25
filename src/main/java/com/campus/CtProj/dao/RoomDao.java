package com.campus.CtProj.dao;

import com.campus.CtProj.domain.EnterDto;
import com.campus.CtProj.domain.RoomDto;
import com.campus.CtProj.domain.SearchCondition;

import java.util.List;

public interface RoomDao {
    int count() throws Exception;


    int delete(Integer bno) throws Exception;

    int insert(RoomDto dto) throws Exception;

    List<RoomDto> selectAll() throws Exception;


    RoomDto select(Integer bno) throws Exception;


    List<RoomDto> selectCategory(String category);

    List<RoomDto> selectRoom(List<Integer> list) throws Exception;

    List<RoomDto> selectHostRoom(String writer) throws Exception;


    int update(RoomDto dto) throws Exception;

    int countId(String writer) throws Exception;

    List<RoomDto> searchSelectPage(SearchCondition sc) throws Exception;

}
