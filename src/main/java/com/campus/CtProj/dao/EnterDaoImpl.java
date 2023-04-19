package com.campus.CtProj.dao;

import com.campus.CtProj.domain.EnterDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class EnterDaoImpl implements EnterDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "com.campus.CtProj.dao.EnterMapper.";

    @Override
    public int countId(String user_id) throws Exception {
        return session.selectOne(namespace + "countId",user_id);
    }

    @Override
    public int deleteAll(Integer room_bno) throws Exception {
        return session.delete(namespace+"deleteAll",room_bno);
    }


    @Override
    public int delete(Integer room_bno, String user_id) throws Exception {
        Map map = new HashMap();
        map.put("room_bno", room_bno);
        map.put("user_id", user_id);
        return session.delete(namespace + "delete", map);
    } // int delete(String statement, Object parameter)

//    @Override
//    public int update(EnterDto dto) throws Exception {
//        return session.insert(namespace + "update", dto);
//    }


    @Override
    public int insert(EnterDto dto) throws Exception {
        return session.insert(namespace + "insert", dto);
    } // int insert(String statement, Object parameter)

    @Override
    public List<EnterDto> selectAll() throws Exception {
        return session.selectList(namespace+"selectAll");
    } // List<E> selectList(String statement)

    @Override
    public List<Integer> selectRoomBno(String user_id) throws Exception {
        return session.selectList(namespace+"selectRoomBno",user_id);
    } // List<E> selectList(String statement)

    @Override
    public List<String> selectRoomId(Integer room_bno) throws Exception {
        return session.selectList(namespace+"selectRoomId",room_bno);
    } // List<E> selectList(String statement)

    @Override
    public Integer selectBno(EnterDto dto) throws Exception {
        return session.selectOne(namespace + "selectBno", dto);
    } // T selectOne(String statement, Object parameter)




}