package com.campus.CtProj.domain;

public class PageHandler {

    private int totalCnt;       // 총 게시물 개수
    private int pageSize = 9;       // 한 페이지당 크기
    private int totalPage;      // 전체 페이지의 개수
    private int naviSize = 6;       // 페이지 내비게이션의 크기
    private int page;       // 현재페이지
    private int beginPage;      // 내비게이션의 첫번째 페이지
    private int endPage;        // 내비게이션의 마지막 페이지
    boolean showPrev;           // 이전 페이지로 이동하는 링크를 보여줄 것인지의 여부
    boolean showNext;           // 다음 페이지로 이동하는 링크를 보여줄 것인지의 여부

    public PageHandler(int totalCnt,int page) {
        this.totalCnt = totalCnt;
        this.page = page;

        totalPage = (int)Math.ceil(totalCnt / pageSize);
        beginPage = page / naviSize * naviSize;
        endPage = Math.min(beginPage + naviSize-1,totalPage);
        showPrev = (beginPage != 1);
        showNext = endPage != totalPage;

    }

    @Override
    public String toString() {
        return "PageHandler{" +
                "totalCnt=" + totalCnt +
                ", pageSize=" + pageSize +
                ", totalPage=" + totalPage +
                ", naviSize=" + naviSize +
                ", page=" + page +
                ", beginPage=" + beginPage +
                ", endPage=" + endPage +
                ", showPrev=" + showPrev +
                ", showNext=" + showNext +
                '}';
    }

    public int getTotalCnt() {
        return totalCnt;
    }

    public void setTotalCnt(int totalCnt) {
        this.totalCnt = totalCnt;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getNaviSize() {
        return naviSize;
    }

    public void setNaviSize(int naviSize) {
        this.naviSize = naviSize;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getBeginPage() {
        return beginPage;
    }

    public void setBeginPage(int beginPage) {
        this.beginPage = beginPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }

    public boolean isShowPrev() {
        return showPrev;
    }

    public void setShowPrev(boolean showPrev) {
        this.showPrev = showPrev;
    }

    public boolean isShowNext() {
        return showNext;
    }

    public void setShowNext(boolean showNext) {
        this.showNext = showNext;
    }
}
