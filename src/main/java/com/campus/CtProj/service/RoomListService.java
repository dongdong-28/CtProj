package com.campus.CtProj.service;

import com.campus.CtProj.domain.BoolDto;
import com.campus.CtProj.domain.EnterDto;
import com.campus.CtProj.domain.ReviewDto;
import com.campus.CtProj.domain.RoomDto;

import java.util.List;

public interface RoomListService {
    int getCount(String user_id) throws Exception;


//    int removeMem(Integer room_bno, String user_id) throws Exception;

//    int removeHost(Integer room_bno, String writer) throws Exception;

    List<RoomDto> readMem(String user_id) throws Exception;

    List<RoomDto> readHost(String user_id) throws Exception;

    List<BoolDto> readReviewList(String user_id) throws Exception;

    int removeReview(Integer room_bno, String user_id) throws Exception;

    List<ReviewDto> readReviewUser(Integer room_bno) throws Exception;

}
