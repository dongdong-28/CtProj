package com.campus.CtProj.service;

import com.campus.CtProj.domain.EnterDto;

import java.util.List;

public interface EnterService {
    int getCount(String user_id) throws Exception;

    int remove(Integer room_bno, String user_id) throws Exception;

    List<EnterDto> getList() throws Exception;

//    List<EnterDto> read(String user_id) throws Exception;

    Integer enter(EnterDto dto) throws Exception;

     List<String> selectRoomId(Integer room_bno) throws Exception ;

     int dropOut(Integer room_bno, String user_id,Integer drop_num) throws Exception;


    }
