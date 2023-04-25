package com.campus.CtProj.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Timestamp;
import java.util.Date;
import java.util.Objects;

public class ReviewDto {
    private Integer bno;
    private String UserId;
    private String title;

    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm")
    private Date reviewDate;
    private String reviewPlace;
    @JsonFormat(pattern = "yyyy-MM-dd hh:mm", timezone = "Asia/Seoul")
    private Timestamp reviewRegDate;


    public ReviewDto( String userId, String title, Date reviewDate, String reviewPlace) {
        UserId = userId;
        this.title = title;
        this.reviewDate = reviewDate;
        this.reviewPlace = reviewPlace;
    }

    @Override
    public String toString() {
        return "ReviewDto{" +
                "bno=" + bno +
                ", UserId='" + UserId + '\'' +
                ", title='" + title + '\'' +
                ", reviewDate=" + reviewDate +
                ", reviewPlace='" + reviewPlace + '\'' +
                ", reviewRegDate=" + reviewRegDate +
                '}';
    }

    public Integer getBno() {
        return bno;
    }

    public void setBno(Integer bno) {
        this.bno = bno;
    }

    public String getUserId() {
        return UserId;
    }

    public void setUserId(String userId) {
        UserId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getReviewDate() {
        return reviewDate;
    }

    public void setReviewDate(Date reviewDate) {
        this.reviewDate = reviewDate;
    }

    public String getReviewPlace() {
        return reviewPlace;
    }

    public void setReviewPlace(String reviewPlace) {
        this.reviewPlace = reviewPlace;
    }

    public Timestamp getReviewRegDate() {
        return reviewRegDate;
    }

    public void setReviewRegDate(Timestamp reviewRegDate) {
        this.reviewRegDate = reviewRegDate;
    }
}
