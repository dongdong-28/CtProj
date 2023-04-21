package com.campus.CtProj.dao;

import com.campus.CtProj.domain.EnterDto;
import com.campus.CtProj.domain.BoolDto;

import java.util.List;

public interface BoolDao {
    int countId(String user_id) throws Exception;

    BoolDto select(Integer room_bno, String user_id) throws Exception;

    int deleteAll(Integer room_bno) throws Exception;

    int delete(Integer room_bno, String user_id) throws Exception // int delete(String statement, Object parameter)
    ;

    int update(BoolDto dto) throws Exception;

    int insert(BoolDto dto) throws Exception // int insert(String statement, Object parameter)
    ;

    List<BoolDto> selectAll() throws Exception // List<E> selectList(String statement)
    ;

    Integer selectBno(BoolDto dto) throws Exception // T selectOne(String statement, Object parameter)
    ;

    List<BoolDto> selectRoomId(Integer room_bno) throws Exception;

}
