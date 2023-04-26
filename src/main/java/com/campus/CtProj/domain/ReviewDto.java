package com.campus.CtProj.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Timestamp;
import java.util.Date;
import java.util.Objects;

public class ReviewDto {
    private Integer bno;
    private String userId;
    private String reviewTitle;

    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm")
    private Date reviewDate;
    private String reviewPlace;
    @JsonFormat(pattern = "yyyy-MM-dd hh:mm", timezone = "Asia/Seoul")
    private Timestamp reviewRegDate;


    public ReviewDto(Integer bno, String userId, String reviewTitle, Date reviewDate, String reviewPlace) {
        this.bno = bno;
        this.userId = userId;
        this.reviewTitle = reviewTitle;
        this.reviewDate = reviewDate;
        this.reviewPlace = reviewPlace;
    }

    @Override
    public String toString() {
        return "ReviewDto{" +
                "bno=" + bno +
                ", userId='" + userId + '\'' +
                ", reviewTitle='" + reviewTitle + '\'' +
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
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getReviewTitle() {
        return reviewTitle;
    }

    public void setReviewTitle(String reviewTitle) {
        this.reviewTitle = reviewTitle;
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
