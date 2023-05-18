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
    private double level;
    @JsonFormat(pattern ="yyyy-MM-dd hh:mm", timezone="Asia/Seoul")
    private Timestamp reg_date;

    public UserDto(){}

    public UserDto(String id, String password, String nickname, int coin, double level) {
        this.id = id;
        this.password = password;
        this.nickname = nickname;
        this.coin = coin;
        this.level = level;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        UserDto userDto = (UserDto) o;
        return coin == userDto.coin && Double.compare(userDto.level, level) == 0 && Objects.equals(id, userDto.id) && Objects.equals(password, userDto.password) && Objects.equals(nickname, userDto.nickname);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, password, nickname, coin, level);
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

    public double getLevel() {
        return level;
    }

    public void setLevel(double level) {
        this.level = level;
    }

    public Timestamp getReg_date() {
        return reg_date;
    }

    public void setReg_date(Timestamp reg_date) {
        this.reg_date = reg_date;
    }
}
