package com.example.service;

import com.example.domain.BoardVO;
import com.example.domain.ProductVO1;
import com.example.domain.UserVO;

public interface LikesService {
	public void lpupdate(ProductVO1 vo,String pmodel,String lmodel,int lno,String lpcnt);
	public void lpinsert(ProductVO1 vo,String pmodel,String lmodel, int lno,String lpcnt);
	public void lpupdate1(ProductVO1 vo,String pmodel,String lmodel,int lno,String lpcnt);

	public void lbupdate(BoardVO vo,int bno,String lbno,int lno,String lbcnt);
	public void lbinsert(BoardVO vo,int bno);
	public void lbupdate1(BoardVO vo,int bno,String lbno,int lno,String lbcnt);
}
