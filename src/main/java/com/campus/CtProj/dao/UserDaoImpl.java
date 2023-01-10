package com.campus.CtProj.dao;

import com.campus.CtProj.domain.UserDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl implements UserDao {

    @Autowired private SqlSession session;
    private static String namespace = "com.campus.CtProj.dao.UserMapper.";


    @Override
    public UserDto selectUser(String id) throws Exception {
        return session.selectOne(namespace + "select", id);

    }

    @Override
    public int deleteUser(String id) throws Exception {
        return session.delete(namespace + "delete",id);

    }

    @Override
    public int insertUser(UserDto dto) throws Exception {
        return session.insert(namespace + "insert",dto);

    }

    @Override
    public int updateUser(UserDto dto) throws Exception {
        return session.update(namespace + "update",dto);

    }

    @Override
    public int deleteAll() throws Exception {
        return session.delete(namespace+"deleteAll");
    }

}
