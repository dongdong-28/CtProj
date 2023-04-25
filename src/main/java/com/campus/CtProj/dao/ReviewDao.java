package com.campus.CtProj.dao;

import com.campus.CtProj.domain.ReviewDto;

import java.util.List;

public interface ReviewDao {
    int count() throws Exception // T selectOne(String statement)
    ;


    int delete(Integer bno) throws Exception // int delete(String statement, Object parameter)
    ;

    int insert(ReviewDto dto) throws Exception // int insert(String statement, Object parameter)
    ;

    List<ReviewDto> selectAll() throws Exception // List<E> selectList(String statement)
    ;

    ReviewDto select(Integer bno) throws Exception // T selectOne(String statement, Object parameter)
    ;
}
