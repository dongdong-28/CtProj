package com.campus.CtProj.domain;

public class SearchCondition {

    private String keyword;
    private String option;

    public SearchCondition(String keyword, String option) {
        this.keyword = keyword;
        this.option = option;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public void setOption(String option) {
        this.option = option;
    }

    public String getKeyword() {
        return keyword;
    }

    public String getOption() {
        return option;
    }

    @Override
    public String toString() {
        return "SearchCondition{" +
                "keyword='" + keyword + '\'' +
                ", option='" + option + '\'' +
                '}';
    }
}
