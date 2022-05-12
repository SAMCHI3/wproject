package com.example.dao;

import com.example.domain.LikesVO;
import com.example.domain.ProductVO1;

public interface LikesDAO {
	public void lpupdate(LikesVO vo, String lmodel, int lno,String lpcnt);
	public void insert(LikesVO vo);
	public void lpupdate1(LikesVO vo, String lmodel, int lno,String lpcnt);

	public void lbupdate(LikesVO vo, String lbno, int lno,String lbcnt);
	public void lbinsert(LikesVO vo);
	public void lbupdate1(LikesVO vo, String lbno, int lno,String lbcnt);
}
