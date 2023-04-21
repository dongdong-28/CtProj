package com.campus.CtProj.service;

import com.campus.CtProj.domain.BoolDto;
import com.campus.CtProj.domain.RoomDto;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface RoomInService {
    @Transactional(rollbackFor = Exception.class)
    int getCount(String user_id) throws Exception;

    RoomDto read(int bno) throws Exception;

    int removeMem(Integer room_bno, String user_id) throws Exception;

    int removeHost(Integer room_bno, String writer) throws Exception;

    @Transactional(rollbackFor = Exception.class)
    List<String> readMemId(Integer room_bno) throws Exception;

    int confirmMem(Integer room_bno, String user_id, Integer isReview, Integer isCoinReturn) throws Exception;

    List<BoolDto> readReviewUser(Integer room_bno) throws Exception;

    }
