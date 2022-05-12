package com.example.domain;

public class UserVO {
	private String uname;
	private String utel;
	private String uaddress;
	private String uaddress1;
	private String uemail;
	private String uid;
	private String upass;
	private String ugender;
	private String upay;
	private int upoint;
	private String ucode;
	private String uimage;
	private String udate;
	private String udate2;
	private String udate3;
	private String uplike;
	
	public String getUplike() {
		return uplike;
	}
	public void setUplike(String uplike) {
		this.uplike = uplike;
	}
	public String getUdate() {
		return udate;
	}
	public void setUdate(String udate) {
		this.udate = udate;
	}
	public String getUdate2() {
		return udate2;
	}
	public void setUdate2(String udate2) {
		this.udate2 = udate2;
	}
	public String getUdate3() {
		return udate3;
	}
	public void setUdate3(String udate3) {
		this.udate3 = udate3;
	}
	public String getUaddress1() {
		return uaddress1;
	}
	public void setUaddress1(String uaddress1) {
		this.uaddress1 = uaddress1;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUtel() {
		return utel;
	}
	public void setUtel(String utel) {
		this.utel = utel;
	}
	public String getUaddress() {
		return uaddress;
	}
	public void setUaddress(String uaddress) {
		this.uaddress = uaddress;
	}
	public String getUemail() {
		return uemail;
	}
	public void setUemail(String uemail) {
		this.uemail = uemail;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUpass() {
		return upass;
	}
	public void setUpass(String upass) {
		this.upass = upass;
	}
	public String getUgender() {
		return ugender;
	}
	public void setUgender(String ugender) {
		this.ugender = ugender;
	}
	public String getUpay() {
		return upay;
	}
	public void setUpay(String upay) {
		this.upay = upay;
	}
	public int getUpoint() {
		return upoint;
	}
	public void setUpoint(int upoint) {
		this.upoint = upoint;
	}
	public String getUcode() {
		return ucode;
	}
	public void setUcode(String ucode) {
		this.ucode = ucode;
	}
	public String getUimage() {
		return uimage;
	}
	public void setUimage(String uimage) {
		this.uimage = uimage;
	}
	@Override
	public String toString() {
		return "UserVO [uname=" + uname + ", utel=" + utel + ", uaddress=" + uaddress + ", uaddress1=" + uaddress1
				+ ", uemail=" + uemail + ", uid=" + uid + ", upass=" + upass + ", ugender=" + ugender + ", upay=" + upay
				+ ", upoint=" + upoint + ", ucode=" + ucode + ", uimage=" + uimage + ", udate=" + udate + ", udate2="
				+ udate2 + ", udate3=" + udate3 + ", uplike=" + uplike + "]";
	}
}