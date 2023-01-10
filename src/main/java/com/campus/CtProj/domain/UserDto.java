package com.campus.CtProj.domain;

import java.util.Date;
import java.util.Objects;

public class UserDto {


    private String id;
    private String password;
    private String nickname;
    private int point;
    private int level;
    private String img_profile;
    private Date reg_date;
    private int list_num;

    public UserDto(){}

    public UserDto(String id, String password, String nickname, int point, int level, String img_profile, Date reg_date, int list_num) {
        this.id = id;
        this.password = password;
        this.nickname = nickname;
        this.point = point;
        this.level = level;
        this.img_profile = img_profile;
        this.reg_date = reg_date;
        this.list_num = list_num;
    }
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        UserDto userDto = (UserDto) o;
        return id == userDto.id && password == userDto.password && list_num == userDto.list_num && nickname.equals(userDto.nickname);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, password, nickname, list_num);
    }

    @Override
    public String toString() {
        return "UserDto{" +
                "id=" + id +
                ", password=" + password +
                ", nickname='" + nickname + '\'' +
                ", point=" + point +
                ", level=" + level +
                ", img_profile='" + img_profile + '\'' +
                ", reg_date=" + reg_date +
                ", list_num=" + list_num +
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

    public int getPoint() {
        return point;
    }

    public void setPoint(int point) {
        this.point = point;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public String getImg_profile() {
        return img_profile;
    }

    public void setImg_profile(String img_profile) {
        this.img_profile = img_profile;
    }

    public Date getReg_date() {
        return reg_date;
    }

    public void setReg_date(Date reg_date) {
        this.reg_date = reg_date;
    }

    public int getList_num() {
        return list_num;
    }

    public void setList_num(int list_num) {
        this.list_num = list_num;
    }
}
