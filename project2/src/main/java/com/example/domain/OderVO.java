package com.example.domain;

import java.util.Date;

public class OderVO {
	private String ocode; //상품코드
	private String oename; //상품영어이름
	private String okname; //상품한글이름
	private String omodel; //상품모델명
	private Date odate; //상품구매및판매확정일
	private String osell; //
	private String obuy;
	private String oid;
	private int oprice;
	public String getOcode() {
		return ocode;
	}
	public void setOcode(String ocode) {
		this.ocode = ocode;
	}
	public String getOename() {
		return oename;
	}
	public void setOename(String oename) {
		this.oename = oename;
	}
	public String getOkname() {
		return okname;
	}
	public void setOkname(String okname) {
		this.okname = okname;
	}
	public String getOmodel() {
		return omodel;
	}
	public void setOmodel(String omodel) {
		this.omodel = omodel;
	}
	public Date getOdate() {
		return odate;
	}
	public void setOdate(Date odate) {
		this.odate = odate;
	}
	public String getOsell() {
		return osell;
	}
	public void setOsell(String osell) {
		this.osell = osell;
	}
	public String getObuy() {
		return obuy;
	}
	public void setObuy(String obuy) {
		this.obuy = obuy;
	}
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public int getOprice() {
		return oprice;
	}
	public void setOprice(int oprice) {
		this.oprice = oprice;
	}
	
	@Override
	public String toString() {
		return "OderVO [ocode=" + ocode + ", oename=" + oename + ", okname=" + okname + ", omodel=" + omodel
				+ ", odate=" + odate + ", osell=" + osell + ", obuy=" + obuy + ", oid=" + oid + ", oprice=" + oprice
				+ "]";
	}
}
