package com.campus.CtProj.domain;

public class SearchCondition {

    private String keyword;
    private String option;
    private String category;

    public SearchCondition(String keyword, String option,String category) {
        this.keyword = keyword;
        this.option = option;
        this.category = category;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public void setOption(String option) {
        this.option = option;
    }
    public void setCategory(String category) {
        this.category = category;
    }

    public String getKeyword() {
        return keyword;
    }

    public String getOption() {
        return option;
    }
    public String getCategory() {
        return category;
    }

    @Override
    public String toString() {
        return "SearchCondition{" +
                "keyword='" + keyword + '\'' +
                ", option='" + option + '\'' +
                ", category='" + category + '\'' +
                '}';
    }
}
