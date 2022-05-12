package com.example.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;


public class ReplyVO extends BoardVO{
	private String rid;
	private String rcontent;
	private String rimage;
	private int rrlike;
	private int rno;
	private int rbno;
	private int rcount;
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Date rdate;
	public String getRid() {
		return rid;
	}
	public void setRid(String rid) {
		this.rid = rid;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public String getRimage() {
		return rimage;
	}
	public void setRimage(String rimage) {
		this.rimage = rimage;
	}
	public int getRrlike() {
		return rrlike;
	}
	public void setRrlike(int rrlike) {
		this.rrlike = rrlike;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getRbno() {
		return rbno;
	}
	public void setRbno(int rbno) {
		this.rbno = rbno;
	}
	public int getRcount() {
		return rcount;
	}
	public void setRcount(int rcount) {
		this.rcount = rcount;
	}
	public Date getRdate() {
		return rdate;
	}
	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}
	@Override
	public String toString() {
		return "ReplyVO [rid=" + rid + ", rcontent=" + rcontent + ", rimage=" + rimage + ", rrlike=" + rrlike + ", rno="
				+ rno + ", rbno=" + rbno + ", rcount=" + rcount + ", rdate=" + rdate + "]";
	}
	
	
	
	
}
