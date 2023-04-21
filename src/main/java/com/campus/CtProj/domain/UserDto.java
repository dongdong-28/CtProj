package com.campus.CtProj.domain;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.sql.Timestamp;
import java.util.Date;
import java.util.Objects;

public class UserDto {


    private String id;
    private String password;
    private String nickname;
    private int coin;
    private float level;
    private String filename;
    private String filepath;
    @JsonFormat(pattern ="yyyy-MM-dd hh:mm", timezone="Asia/Seoul")
    private Timestamp reg_date;

    public UserDto(){}

    public UserDto(String id, String password, String nickname, int coin, float level, String filename, String filepath, Timestamp reg_date) {
        this.id = id;
        this.password = password;
        this.nickname = nickname;
        this.coin = coin;
        this.level = level;
        this.filename = filename;
        this.filepath = filepath;
        this.reg_date = reg_date;
    }

    @Override
    public String toString() {
        return "UserDto{" +
                "id='" + id + '\'' +
                ", password='" + password + '\'' +
                ", nickname='" + nickname + '\'' +
                ", coin=" + coin +
                ", level=" + level +
                ", filename='" + filename + '\'' +
                ", filepath='" + filepath + '\'' +
                ", reg_date=" + reg_date +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public int getCoin() {
        return coin;
    }

    public void setCoin(int coin) {
        this.coin = coin;
    }

    public float getLevel() {
        return level;
    }

    public void setLevel(float level) {
        this.level = level;
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

    public Timestamp getReg_date() {
        return reg_date;
    }

    public void setReg_date(Timestamp reg_date) {
        this.reg_date = reg_date;
    }
}
