package com.campus.CtProj.service;

import com.campus.CtProj.domain.UserDto;

public interface UserService {
    UserDto getUser(String id) throws Exception;
}
