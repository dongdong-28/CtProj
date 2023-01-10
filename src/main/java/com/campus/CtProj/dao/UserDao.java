package com.campus.CtProj.dao;

import com.campus.CtProj.domain.UserDto;

public interface UserDao {
    UserDto selectUser(String id) throws Exception;

    int deleteUser(String id) throws Exception;

    int insertUser(UserDto dto) throws Exception;

    int updateUser(UserDto dto) throws Exception;

    int deleteAll() throws Exception;


}
