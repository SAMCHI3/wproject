package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.SystemPropertyUtils;

import com.example.dao.BoardDAO;
import com.example.dao.LikesDAO;
import com.example.dao.ProductListDAO;
import com.example.dao.UserDAO;
import com.example.domain.BoardVO;
import com.example.domain.LikesVO;
import com.example.domain.ProductVO;
import com.example.domain.ProductVO1;
import com.example.domain.UserVO;

@Service
public class LikesServiceImpl implements LikesService{
	@Autowired
	LikesDAO ldao;
	
	@Autowired
	ProductListDAO pdao;
	
	@Autowired
	BoardDAO bdao;
	
	@Transactional
	@Override
	public void lpinsert(ProductVO1 vo, String pmodel, String lmodel, int lno,String lpcnt) {
		System.out.println("......." + "\n" + vo.getPlcount());
		ldao.insert(vo);
		pdao.plcount(pmodel, vo);
		ldao.lpupdate(vo,lmodel,lno,lpcnt);
	}

	@Transactional
	@Override
	public void lpupdate(ProductVO1 vo, String pmodel, String lmodel, int lno,String lpcnt) {
		System.out.println("......." +lpcnt +"서비스엘피"+ "\n" + vo.getPlcount() + "서비스카운트");
			pdao.plcount(pmodel, vo);
			ldao.lpupdate(vo,lmodel,lno,lpcnt);
			
		
	}

	@Override
	public void lpupdate1(ProductVO1 vo, String pmodel, String lmodel, int lno, String lpcnt) {
		pdao.plcountcancel(pmodel, vo);
		ldao.lpupdate(vo,lmodel,lno,lpcnt);
		
	}
	
	@Override
	public void lbupdate(BoardVO vo, int bno, String lbno, int lno, String lbcnt) {
		bdao.blcount(bno, vo);
		ldao.lbupdate(vo, lbno, lno, lbcnt);
		
	}

	@Override
	public void lbinsert(BoardVO vo, int bno) {
		ldao.lbinsert(vo);
		bdao.blcount(bno, vo);
		
	}

	@Override
	public void lbupdate1(BoardVO vo, int bno, String lbno, int lno, String lbcnt) {
		bdao.blcountcancel(bno, vo);
		ldao.lbupdate1(vo, lbno, lno, lbcnt);
		
	}
}
