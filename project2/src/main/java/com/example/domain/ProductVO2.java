package com.example.domain;

import java.util.Date;

public class ProductVO2 extends BuyVO1{
	private String pcode;
	private String pbrand;
	private String pename;
	private String pkname;
	private String pimage;
	private String pmodel;
	private Date pdate;
	private String plprice;
	private int plcount;
	private int pcount;
	private String pccode;
	private String plux;
	private String pgender;
	
	public String getPgender() {
		return pgender;
	}
	public void setPgender(String pgender) {
		this.pgender = pgender;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public String getPbrand() {
		return pbrand;
	}
	public void setPbrand(String pbrand) {
		this.pbrand = pbrand;
	}
	public String getPename() {
		return pename;
	}
	public void setPename(String pename) {
		this.pename = pename;
	}
	public String getPkname() {
		return pkname;
	}
	public void setPkname(String pkname) {
		this.pkname = pkname;
	}
	public String getPimage() {
		return pimage;
	}
	public void setPimage(String pimage) {
		this.pimage = pimage;
	}
	public String getPmodel() {
		return pmodel;
	}
	public void setPmodel(String pmodel) {
		this.pmodel = pmodel;
	}
	public Date getPdate() {
		return pdate;
	}
	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}
	public String getPlprice() {
		return plprice;
	}
	public void setPlprice(String plprice) {
		this.plprice = plprice;
	}
	public int getPlcount() {
		return plcount;
	}
	public void setPlcount(int plcount) {
		this.plcount = plcount;
	}
	public int getPcount() {
		return pcount;
	}
	public void setPcount(int pcount) {
		this.pcount = pcount;
	}
	public String getPccode() {
		return pccode;
	}
	public void setPccode(String pccode) {
		this.pccode = pccode;
	}
	public String getPlux() {
		return plux;
	}
	public void setPlux(String plux) {
		this.plux = plux;
	}
	
	@Override
	public String toString() {
		return "ProductVO [pcode=" + pcode + ", pbrand=" + pbrand + ", pename=" + pename + ", pkname=" + pkname
				+ ", pimage=" + pimage + ", pmodel=" + pmodel + ", pdate=" + pdate + ", plprice=" + plprice
				+ ", plcount=" + plcount + ", pcount=" + pcount + ", pccode=" + pccode + ", plux=" + plux + ", pgender="
				+ pgender + "]";
	}
}
