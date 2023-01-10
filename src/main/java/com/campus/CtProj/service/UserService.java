package com.campus.CtProj.service;

import com.campus.CtProj.dao.UserDao;
import com.campus.CtProj.domain.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    UserDao userDao;

    UserService() {}

    public UserDto getUser(String id) throws Exception {

        return userDao.selectUser(id);
    }














}
