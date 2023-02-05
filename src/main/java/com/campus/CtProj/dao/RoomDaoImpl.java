package com.campus.CtProj.dao;

import com.campus.CtProj.domain.RoomDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class RoomDaoImpl implements RoomDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "com.campus.CtProj.dao.roomMapper.";

    @Override
    public int count() throws Exception {
        return session.selectOne(namespace + "count");
    } // T selectOne(String statement)

    @Override
    public int countId(String writer) throws Exception {
        return session.selectOne(namespace + "countId", writer);
    }


    @Override
    public int delete(Integer bno, String writer) throws Exception {
        Map map = new HashMap();
        map.put("bno", bno);
        map.put("writer", writer);
        return session.delete(namespace + "delete", map);
    } // int delete(String statement, Object parameter)

    @Override
    public int insert(RoomDto dto) throws Exception {
        return session.insert(namespace + "insert", dto);
    } // int insert(String statement, Object parameter)

    @Override
    public List<RoomDto> selectAll() throws Exception {
        return session.selectList(namespace+"selectAll");
    } // List<E> selectList(String statement)

    @Override
    public RoomDto select(Integer bno) throws Exception {
        return session.selectOne(namespace + "select", bno);
    } // T selectOne(String statement, Object parameter)

    @Override
    public List<RoomDto> selectCategory(String category) {
        return session.selectList(namespace+"selectCategory", category);
    }


    @Override
    public List<RoomDto> selectRoom(List<Integer> list) throws Exception {
        return session.selectList(namespace + "selectRoom", list);
    } // T selectOne(String statement, Object parameter)

    @Override
    public List<RoomDto> selectHostRoom(String writer) throws Exception {
        return session.selectList(namespace + "selectHostRoom", writer);
    } // T selectOne(String statement, Object parameter)


    @Override
    public int update(RoomDto dto) throws Exception {
        return session.update(namespace + "update", dto);
    } // int update(String statement, Object parameter)
//
//    @Override
//    public int increaseViewCnt(Integer bno) throws Exception {
//        return session.update(namespace+"increaseViewCnt", bno);
//    } // int update(String statement, Object parameter)
//


}