package com.campus.CtProj.domain;

public class BoolDto {

    private int bno;
    private String user_id;
    private int room_bno;
    private int is_coin_return;
    private int is_drop;
    private int is_review;

    public BoolDto() {}

    public BoolDto(String user_id, int room_bno) {
        this.user_id = user_id;
        this.room_bno = room_bno;
    }

    @Override
    public String toString() {
        return "boolDto{" +
                "bno=" + bno +
                ", user_id='" + user_id + '\'' +
                ", room_bno=" + room_bno +
                ", is_coin_return=" + is_coin_return +
                ", is_drop=" + is_drop +
                ", is_review=" + is_review +
                '}';
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

    public int getis_coin_return() {
        return is_coin_return;
    }

    public void setis_coin_return(int is_coin_return) {
        this.is_coin_return = is_coin_return;
    }

    public int getis_drop() {
        return is_drop;
    }

    public void setis_drop(int is_drop) {
        this.is_drop = is_drop;
    }

    public int getis_review() {
        return is_review;
    }

    public void setis_review(int is_review) {
        this.is_review = is_review;
    }
}
