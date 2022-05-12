package com.example.domain;

import java.util.Date;

public class ApiVO {
	private String aid;
	private String aemail;
	private String aname;
	private String amodel;
	private String akname;
	private String aprice;
	private Date adate;
	private String aaddress;
	private String aaddress1;
	private String atell;
	private String apay;
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public String getAemail() {
		return aemail;
	}
	public void setAemail(String aemail) {
		this.aemail = aemail;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public String getAmodel() {
		return amodel;
	}
	public void setAmodel(String amodel) {
		this.amodel = amodel;
	}
	public String getAkname() {
		return akname;
	}
	public void setAkname(String akname) {
		this.akname = akname;
	}
	public String getAprice() {
		return aprice;
	}
	public void setAprice(String aprice) {
		this.aprice = aprice;
	}
	public Date getAdate() {
		return adate;
	}
	public void setAdate(Date adate) {
		this.adate = adate;
	}
	public String getAaddress() {
		return aaddress;
	}
	public void setAaddress(String aaddress) {
		this.aaddress = aaddress;
	}
	public String getAaddress1() {
		return aaddress1;
	}
	public void setAaddress1(String aaddress1) {
		this.aaddress1 = aaddress1;
	}
	public String getAtell() {
		return atell;
	}
	public void setAtell(String atell) {
		this.atell = atell;
	}
	public String getApay() {
		return apay;
	}
	public void setApay(String apay) {
		this.apay = apay;
	}
	
	@Override
	public String toString() {
		return "ApiVO [aid=" + aid + ", aemail=" + aemail + ", aname=" + aname + ", amodel=" + amodel + ", akname="
				+ akname + ", aprice=" + aprice + ", adate=" + adate + ", aaddress=" + aaddress + ", aaddress1="
				+ aaddress1 + ", atell=" + atell + ", apay=" + apay + "]";
	}
}
