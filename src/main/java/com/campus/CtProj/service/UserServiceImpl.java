package com.campus.CtProj.service;

import com.campus.CtProj.dao.UserDao;
import com.campus.CtProj.domain.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    UserDao userDao;

    @Autowired
    UserServiceImpl(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public UserDto getUser(String id) throws Exception {

        return userDao.selectUser(id);
    }














}
