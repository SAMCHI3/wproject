package com.example.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class BuyVO extends UserVO{
	private int bprice;
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Date bdate;
	private String bid;
	private String baddress;
	private String baddress1;
	private String btell;
	private String bsize;
	private String bpay;
	private String bmodel;
	private String ing;
	private String bout;
	private int bcode;
	
	public int getBcode() {
		return bcode;
	}
	public void setBcode(int bcode) {
		this.bcode = bcode;
	}
	public String getBout() {
		return bout;
	}
	public void setBout(String bout) {
		this.bout = bout;
	}
	public String getIng() {
		return ing;
	}
	public void setIng(String ing) {
		this.ing = ing;
	}
	public int getBprice() {
		return bprice;
	}
	public void setBprice(int bprice) {
		this.bprice = bprice;
	}
	public Date getBdate() {
		return bdate;
	}
	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}
	public String getBid() {
		return bid;
	}
	public void setBid(String bid) {
		this.bid = bid;
	}
	public String getBaddress() {
		return baddress;
	}
	public void setBaddress(String baddress) {
		this.baddress = baddress;
	}
	public String getBaddress1() {
		return baddress1;
	}
	public void setBaddress1(String baddress1) {
		this.baddress1 = baddress1;
	}
	public String getBtell() {
		return btell;
	}
	public void setBtell(String btell) {
		this.btell = btell;
	}
	public String getBsize() {
		return bsize;
	}
	public void setBsize(String bsize) {
		this.bsize = bsize;
	}
	public String getBpay() {
		return bpay;
	}
	public void setBpay(String bpay) {
		this.bpay = bpay;
	}
	public String getBmodel() {
		return bmodel;
	}
	public void setBmodel(String bmodel) {
		this.bmodel = bmodel;
	}
	@Override
	public String toString() {
		return "BuyVO [bprice=" + bprice + ", bdate=" + bdate + ", bid=" + bid + ", baddress=" + baddress
				+ ", baddress1=" + baddress1 + ", btell=" + btell + ", bsize=" + bsize + ", bpay=" + bpay + ", bmodel="
				+ bmodel + ", ing=" + ing + ", bout=" + bout + ", bcode=" + bcode + "]";
	}
}
