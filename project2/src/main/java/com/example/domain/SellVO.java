package com.example.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class SellVO extends BuyVO{
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Date sdate;
	private String ssell;
	private String sid;
	private String ssize;
	private String sgender;
	private String scolor;
	private String smodel;
	private int scode;
	private String ing;
	private String sout;
	
	public String getSout() {
		return sout;
	}
	public void setSout(String sout) {
		this.sout = sout;
	}
	public String getIng() {
		return ing;
	}
	public void setIng(String ing) {
		this.ing = ing;
	}
	public Date getSdate() {
		return sdate;
	}
	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}
	public String getSsell() {
		return ssell;
	}
	public void setSsell(String ssell) {
		this.ssell = ssell;
	}
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public String getSsize() {
		return ssize;
	}
	public void setSsize(String ssize) {
		this.ssize = ssize;
	}
	public String getSgender() {
		return sgender;
	}
	public void setSgender(String sgender) {
		this.sgender = sgender;
	}
	public String getScolor() {
		return scolor;
	}
	public void setScolor(String scolor) {
		this.scolor = scolor;
	}
	public String getSmodel() {
		return smodel;
	}
	public void setSmodel(String smodel) {
		this.smodel = smodel;
	}
	public int getScode() {
		return scode;
	}
	public void setScode(int scode) {
		this.scode = scode;
	}
	@Override
	public String toString() {
		return "SellVO [sdate=" + sdate + ", ssell=" + ssell + ", sid=" + sid + ", ssize=" + ssize + ", sgender="
				+ sgender + ", scolor=" + scolor + ", smodel=" + smodel + ", scode=" + scode + ", ing=" + ing
				+ ", sout=" + sout + "]";
	}

}
