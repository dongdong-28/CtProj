package com.campus.CtProj.dao;

import com.campus.CtProj.domain.EnterDto;
import com.campus.CtProj.domain.BoolDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class BoolDaoImpl implements BoolDao {
    @Autowired
    private SqlSession session;

    private static String namespace = "com.campus.CtProj.dao.boolMapper.";

    @Override
    public int countId(String user_id) throws Exception {
        return session.selectOne(namespace + "countId", user_id);
    }

    @Override
    public int deleteAll(Integer room_bno) throws Exception {
        return session.delete(namespace + "deleteAll", room_bno);
    }

    @Override
    public BoolDto select(Integer room_bno, String user_id) throws Exception {
        Map map = new HashMap();
        map.put("room_bno", room_bno);
        map.put("user_id", user_id);
        return session.selectOne(namespace + "select", map);
    } // T selectOne(String statement, Object parameter)


    @Override
    public int delete(Integer room_bno, String user_id) throws Exception {
        Map map = new HashMap();
        map.put("room_bno", room_bno);
        map.put("user_id", user_id);
        return session.delete(namespace + "delete", map);
    } // int delete(String statement, Object parameter)

    @Override
    public int update(BoolDto dto) throws Exception {
        return session.insert(namespace + "update", dto);
    }


    @Override
    public int insert(BoolDto dto) throws Exception {
        return session.insert(namespace + "insert", dto);
    } // int insert(String statement, Object parameter)

    @Override
    public List<BoolDto> selectAll() throws Exception {
        return session.selectList(namespace + "selectAll");
    } // List<E> selectList(String statement)


    @Override
    public Integer selectBno(BoolDto dto) throws Exception {
        return session.selectOne(namespace + "selectBno", dto);
    } // T selectOne(String statement, Object parameter)


}