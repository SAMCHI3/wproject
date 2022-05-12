package com.example.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class NoticeVO {
	private String notice;
	private String npo;
	private String nfaq;
	private String ncode1;
	private String ncode2;
	@JsonFormat(pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date ndate;
	private String ntitle;
	private String nid;
	private int ncount;
	
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	public String getNpo() {
		return npo;
	}
	public void setNpo(String npo) {
		this.npo = npo;
	}
	public String getNfaq() {
		return nfaq;
	}
	public void setNfaq(String nfaq) {
		this.nfaq = nfaq;
	}
	public String getNcode1() {
		return ncode1;
	}
	public void setNcode1(String ncode1) {
		this.ncode1 = ncode1;
	}
	public String getNcode2() {
		return ncode2;
	}
	public void setNcode2(String ncode2) {
		this.ncode2 = ncode2;
	}
	public Date getNdate() {
		return ndate;
	}
	public void setNdate(Date ndate) {
		this.ndate = ndate;
	}
	public String getNtitle() {
		return ntitle;
	}
	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}
	public String getNid() {
		return nid;
	}
	public void setNid(String nid) {
		this.nid = nid;
	}
	public int getNcount() {
		return ncount;
	}
	public void setNcount(int ncount) {
		this.ncount = ncount;
	}
	@Override
	public String toString() {
		return "NoticeVO [notice=" + notice + ", npo=" + npo + ", nfaq=" + nfaq + ", ncode1=" + ncode1 + ", ncode2="
				+ ncode2 + ", ndate=" + ndate + ", ntitle=" + ntitle + ", nid=" + nid + ", ncount=" + ncount + "]";
	}
	
	
	
	
	
}
