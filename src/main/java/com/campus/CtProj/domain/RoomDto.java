package com.campus.CtProj.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Timestamp;

import java.util.Date;
import java.util.Objects;

public class RoomDto {
    private Integer bno;
    private String title;
    private String filename;
    private String filepath;
    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm")
    private Date meet_Date;
    private String meet_place;
    private String meet_place_road;
    private String notice;
    private String category;
    @JsonFormat(pattern = "yyyy-MM-dd hh:mm", timezone = "Asia/Seoul")
    private Timestamp reg_date;
    @JsonFormat(pattern = "yyyy-MM-dd hh:mm", timezone = "Asia/Seoul")
    private Timestamp up_date;
    private String writer;
    private int user_limit;
    private int user_cnt = 1;

    public RoomDto() {
    }

    public RoomDto(Integer bno, String title, String filename, String filepath, Date meet_Date, String meet_place, String meet_place_road, String notice, String category, String writer, int user_limit, int user_cnt) {
        this.bno = bno;
        this.title = title;
        this.filename = filename;
        this.filepath = filepath;
        this.meet_Date = meet_Date;
        this.meet_place = meet_place;
        this.meet_place_road = meet_place_road;
        this.notice = notice;
        this.category = category;
        this.writer = writer;
        this.user_limit = user_limit;
        this.user_cnt = user_cnt;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        RoomDto roomDto = (RoomDto) o;
        return user_limit == roomDto.user_limit && user_cnt == roomDto.user_cnt && Objects.equals(bno, roomDto.bno) && Objects.equals(title, roomDto.title) && Objects.equals(filename, roomDto.filename) && Objects.equals(filepath, roomDto.filepath) && Objects.equals(meet_Date, roomDto.meet_Date) && Objects.equals(meet_place, roomDto.meet_place) && Objects.equals(meet_place_road, roomDto.meet_place_road) && Objects.equals(notice, roomDto.notice) && Objects.equals(category, roomDto.category) && Objects.equals(reg_date, roomDto.reg_date) && Objects.equals(up_date, roomDto.up_date) && Objects.equals(writer, roomDto.writer);
    }

    @Override
    public int hashCode() {
        return Objects.hash(bno, title, filename, filepath, meet_Date, meet_place, meet_place_road, notice, category, reg_date, up_date, writer, user_limit, user_cnt);
    }

    @Override
    public String toString() {
        return "RoomDto{" +
                "bno=" + bno +
                ", title='" + title + '\'' +
                ", filename='" + filename + '\'' +
                ", filepath='" + filepath + '\'' +
                ", meet_Date=" + meet_Date +
                ", meet_place='" + meet_place + '\'' +
                ", meet_place_road='" + meet_place_road + '\'' +
                ", notice='" + notice + '\'' +
                ", category='" + category + '\'' +
                ", reg_date=" + reg_date +
                ", up_date=" + up_date +
                ", writer='" + writer + '\'' +
                ", user_limit=" + user_limit +
                ", user_cnt=" + user_cnt +
                '}';
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

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getFilepath() {
        return filepath;
    }

    public void setFilepath(String filepath) {
        this.filepath = filepath;
    }

    public Date getMeet_Date() {
        return meet_Date;
    }

    public void setMeet_Date(Date meet_Date) {
        this.meet_Date = meet_Date;
    }

    public String getMeet_place() {
        return meet_place;
    }

    public void setMeet_place(String meet_place) {
        this.meet_place = meet_place;
    }

    public String getMeet_place_road() {
        return meet_place_road;
    }

    public void setMeet_place_road(String meet_place_road) {
        this.meet_place_road = meet_place_road;
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

    public Timestamp getReg_date() {
        return reg_date;
    }

    public void setReg_date(Timestamp reg_date) {
        this.reg_date = reg_date;
    }

    public Timestamp getUp_date() {
        return up_date;
    }

    public void setUp_date(Timestamp up_date) {
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
