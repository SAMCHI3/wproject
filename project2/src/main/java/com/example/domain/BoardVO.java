package com.example.domain;

import java.util.Date;

public class BoardVO extends LikesVO{
	private int bno;
	private String bid;
	private Date bdate;
	private String bcontent;
	private String bimage;
	private String bcount;
	private String bcode1;
	private String bcode2;
	private String bcode3;
	private String bcode4;
	private String bcode5;
	private int totalCount; //전체데이터수
	private int startPage; //시작페이지
	private int endPage; //마지막페이지
	private boolean prev; //이전
	private boolean next; //다음
	private int displayPageNum = 10; //화면에보이는 페이지버튼 수
	private Criteria cri;
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getBid() {
		return bid;
	}
	public void setBid(String bid) {
		this.bid = bid;
	}
	public Date getBdate() {
		return bdate;
	}
	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public String getBimage() {
		return bimage;
	}
	public void setBimage(String bimage) {
		this.bimage = bimage;
	}
	public String getBcount() {
		return bcount;
	}
	public void setBcount(String bcount) {
		this.bcount = bcount;
	}
	public String getBcode1() {
		return bcode1;
	}
	public void setBcode1(String bcode1) {
		this.bcode1 = bcode1;
	}
	public String getBcode2() {
		return bcode2;
	}
	public void setBcode2(String bcode2) {
		this.bcode2 = bcode2;
	}
	public String getBcode3() {
		return bcode3;
	}
	public void setBcode3(String bcode3) {
		this.bcode3 = bcode3;
	}
	public String getBcode4() {
		return bcode4;
	}
	public void setBcode4(String bcode4) {
		this.bcode4 = bcode4;
	}
	public String getBcode5() {
		return bcode5;
	}
	public void setBcode5(String bcode5) {
		this.bcode5 = bcode5;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}
	public Criteria getCri() {
		return cri;
	}
	public void setCri(Criteria cri) {
		this.cri = cri;
	}
	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", bid=" + bid + ", bdate=" + bdate + ", bcontent=" + bcontent + ", bimage="
				+ bimage + ", bcount=" + bcount + ", bcode1=" + bcode1 + ", bcode2=" + bcode2 + ", bcode3=" + bcode3
				+ ", bcode4=" + bcode4 + ", bcode5=" + bcode5 + ", totalCount=" + totalCount + ", startPage="
				+ startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next + ", displayPageNum="
				+ displayPageNum + ", cri=" + cri + "]";
	}
	
	
}