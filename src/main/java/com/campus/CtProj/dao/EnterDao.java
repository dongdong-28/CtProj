package com.campus.CtProj.dao;

import com.campus.CtProj.domain.EnterDto;

import java.util.List;

public interface EnterDao {
    int countId(String user_id) throws Exception;

    int delete(Integer room_bno, String user_id) throws Exception // int delete(String statement, Object parameter)
    ;

     int deleteAll(Integer room_bno) throws Exception ;


        int insert(EnterDto dto) throws Exception // int insert(String statement, Object parameter)
    ;

    List<EnterDto> selectAll() throws Exception // List<E> selectList(String statement)
    ;

//    List<EnterDto> select(String user_id) throws Exception // T selectOne(String statement, Object parameter)
//    ;

    List<String> selectRoomId(Integer room_bno) throws Exception // List<E> selectList(String statement)
    ;

    Integer selectBno(EnterDto dto) throws Exception
            ;
    List<Integer> selectRoomBno(String user_id) throws Exception;

    }
