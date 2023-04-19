package com.campus.CtProj.domain;

import java.util.Objects;

public class EnterDto {

    private int bno;
    private String user_id;
    private int room_bno;
    @Override
    public String toString() {
        return "EnterDto{" +
                "bno=" + bno +
                ", user_id='" + user_id + '\'' +
                ", room_bno=" + room_bno;
    }
    public EnterDto() {}
    public EnterDto(String user_id, int room_bno) {
        this.user_id = user_id;
        this.room_bno = room_bno;
    }


    public int getBno() {
        return bno;
    }

    public void setBno(int bno) {
        this.bno = bno;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public int getRoom_bno() {
        return room_bno;
    }

    public void setRoom_bno(int room_bno) {
        this.room_bno = room_bno;
    }


}
