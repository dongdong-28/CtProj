package com.campus.CtProj.dao;

import com.campus.CtProj.domain.ReviewDto;
import com.campus.CtProj.domain.RoomDto;
import com.campus.CtProj.domain.SearchCondition;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class ReviewDaoImpl implements ReviewDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "com.campus.CtProj.dao.reviewMapper.";

    @Override
    public int count() throws Exception {
        return session.selectOne(namespace + "count");
    } // T selectOne(String statement)


    @Override
    public int delete(Integer bno) throws Exception {
        return session.delete(namespace + "delete", bno);
    } // int delete(String statement, Object parameter)

    @Override
    public int insert(ReviewDto dto) throws Exception {
        return session.insert(namespace + "insert", dto);
    } // int insert(String statement, Object parameter)

    @Override
    public List<ReviewDto> selectAll() throws Exception {
        return session.selectList(namespace+"selectAll");
    } // List<E> selectList(String statement)

    @Override
    public ReviewDto select(Integer bno) throws Exception {
        return session.selectOne(namespace + "select", bno);
    } // T selectOne(String statement, Object parameter)



}