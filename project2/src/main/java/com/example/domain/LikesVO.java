package com.example.domain;

public class LikesVO extends ProductVO{
	private int lno;
	private String lid;
	private String lmodel;
	private int lbno;
	private int lrno;
	private int lpcnt;
	private int lbcnt;
	private int lrcnt;
	
	public int getLno() {
		return lno;
	}
	public void setLno(int lno) {
		this.lno = lno;
	}
	public String getLid() {
		return lid;
	}
	public void setLid(String lid) {
		this.lid = lid;
	}
	public String getLmodel() {
		return lmodel;
	}
	public void setLmodel(String lmodel) {
		this.lmodel = lmodel;
	}
	public int getLbno() {
		return lbno;
	}
	public void setLbno(int lbno) {
		this.lbno = lbno;
	}
	public int getLrno() {
		return lrno;
	}
	public void setLrno(int lrno) {
		this.lrno = lrno;
	}
	public int getLpcnt() {
		return lpcnt;
	}
	public void setLpcnt(int lpcnt) {
		this.lpcnt = lpcnt;
	}
	public int getLbcnt() {
		return lbcnt;
	}
	public void setLbcnt(int lbcnt) {
		this.lbcnt = lbcnt;
	}
	public int getLrcnt() {
		return lrcnt;
	}
	public void setLrcnt(int lrcnt) {
		this.lrcnt = lrcnt;
	}
	@Override
	public String toString() {
		return "LikesVO [lno=" + lno + ", lid=" + lid + ", lmodel=" + lmodel + ", lbno=" + lbno + ", lrno=" + lrno
				+ ", lpcnt=" + lpcnt + ", lbcnt=" + lbcnt + ", lrcnt=" + lrcnt + "]";
	}
}
