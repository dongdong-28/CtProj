package com.campus.CtProj.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Timestamp;
import java.util.Date;

public class BoolDto {

    private int bno;
    private String user_id;
    private int room_bno;
    private int is_coin_return;
    private int is_drop;
    private String review_title;
    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm")
    private Date review_date;
    private String review_place;
    @JsonFormat(pattern = "yyyy-MM-dd hh:mm", timezone = "Asia/Seoul")
    private Timestamp review_reg_date;

    public BoolDto() {
    }

    public BoolDto(String user_id, int room_bno) {
        this.user_id = user_id;
        this.room_bno = room_bno;
    }

    @Override
    public String toString() {
        return "BoolDto{" +
                "bno=" + bno +
                ", user_id='" + user_id + '\'' +
                ", room_bno=" + room_bno +
                ", is_coin_return=" + is_coin_return +
                ", is_drop=" + is_drop +
                ", review_title='" + review_title + '\'' +
                ", review_date=" + review_date +
                ", review_place='" + review_place + '\'' +
                ", review_reg_date=" + review_reg_date +
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

    public int getIs_coin_return() {
        return is_coin_return;
    }

    public void setIs_coin_return(int is_coin_return) {
        this.is_coin_return = is_coin_return;
    }

    public int getIs_drop() {
        return is_drop;
    }

    public void setIs_drop(int is_drop) {
        this.is_drop = is_drop;
    }

    public String getReview_title() {
        return review_title;
    }

    public void setReview_title(String review_title) {
        this.review_title = review_title;
    }

    public Date getReview_date() {
        return review_date;
    }

    public void setReview_date(Date review_date) {
        this.review_date = review_date;
    }

    public String getReview_place() {
        return review_place;
    }

    public void setReview_place(String review_place) {
        this.review_place = review_place;
    }

    public Timestamp getReview_reg_date() {
        return review_reg_date;
    }

    public void setReview_reg_date(Timestamp review_reg_date) {
        this.review_reg_date = review_reg_date;
    }
}
