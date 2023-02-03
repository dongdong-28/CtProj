package com.campus.CtProj.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.ibatis.javassist.Loader;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.Objects;

public class RoomDto {
   private Integer bno;
   private String title;
   private String picture;
   @JsonFormat(pattern ="yyyy-MM-dd hh:mm", timezone="Asia/Seoul")
   private Timestamp meet_Date;
   private String meet_place;
   private String notice;
   private String category;
   private Date reg_date;
   private Date up_date;
   private String writer;
   private int user_limit;
   private int user_cnt = 1;

   public RoomDto() {};

    public RoomDto(String title, String picture, String meet_place, String notice, String category, String writer, int user_limit) {
        this.title = title;
        this.picture = picture;
        this.meet_place = meet_place;
        this.notice = notice;
        this.category = category;
        this.writer = writer;
        this.user_limit = user_limit;
    }


    @Override
    public String toString() {
        return "RoomDto{" +
                "bno=" + bno +
                ", title='" + title + '\'' +
                ", picture='" + picture + '\'' +
                ", meet_Date=" + meet_Date +
                ", meet_place='" + meet_place + '\'' +
                ", notice='" + notice + '\'' +
                ", category='" + category + '\'' +
                ", reg_date=" + reg_date +
                ", up_date=" + up_date +
                ", writer='" + writer + '\'' +
                ", user_limit=" + user_limit +
                ", user_cnt=" + user_cnt +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        RoomDto roomDto = (RoomDto) o;
        return user_limit == roomDto.user_limit && user_cnt == roomDto.user_cnt && Objects.equals(bno, roomDto.bno) && Objects.equals(title, roomDto.title) && Objects.equals(picture, roomDto.picture) && Objects.equals(meet_Date, roomDto.meet_Date) && Objects.equals(meet_place, roomDto.meet_place) && Objects.equals(notice, roomDto.notice) && Objects.equals(category, roomDto.category) && Objects.equals(writer, roomDto.writer);
    }

    @Override
    public int hashCode() {
        return Objects.hash(bno, title, picture, meet_Date, meet_place, notice, category, writer, user_limit, user_cnt);
    }

    public Integer getBno() {
        return bno;
    }

    public void setBno(Integer bno) {
        this.bno = bno;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public Timestamp getMeet_Date() {
        return meet_Date;
    }

    public void setMeet_Date(Timestamp meet_Date) {
        this.meet_Date = meet_Date;
    }

    public String getMeet_place() {
        return meet_place;
    }

    public void setMeet_place(String meet_place) {
        this.meet_place = meet_place;
    }

    public String getNotice() {
        return notice;
    }

    public void setNotice(String notice) {
        this.notice = notice;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public Date getReg_date() {
        return reg_date;
    }

    public void setReg_date(Date reg_date) {
        this.reg_date = reg_date;
    }

    public Date getUp_date() {
        return up_date;
    }

    public void setUp_date(Date up_date) {
        this.up_date = up_date;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public int getUser_limit() {
        return user_limit;
    }

    public void setUser_limit(int user_limit) {
        this.user_limit = user_limit;
    }

    public int getUser_cnt() {
        return user_cnt;
    }

    public void setUser_cnt(int user_cnt) {
        this.user_cnt = user_cnt;
    }
}
