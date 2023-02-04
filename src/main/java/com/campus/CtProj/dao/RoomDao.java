package com.campus.CtProj.dao;

import com.campus.CtProj.domain.EnterDto;
import com.campus.CtProj.domain.RoomDto;

import java.util.List;

public interface RoomDao {
    int count() throws Exception // T selectOne(String statement)
    ;


        int delete(Integer bno, String writer) throws Exception // int delete(String statement, Object parameter)
    ;

    int insert(RoomDto dto) throws Exception // int insert(String statement, Object parameter)
    ;

        List<RoomDto> selectAll() throws Exception;


        RoomDto select(Integer bno) throws Exception // T selectOne(String statement, Object parameter)
    ;


    List<RoomDto> selectCategory(String category);

    List<RoomDto> selectRoom(List<Integer> list) throws Exception // T selectOne(String statement, Object parameter)
    ;

     List<RoomDto> selectHostRoom(String writer) throws Exception
             ;


        int update(RoomDto dto) throws Exception // int update(String statement, Object parameter)
    ;

    int countId(String writer) throws Exception;
}
