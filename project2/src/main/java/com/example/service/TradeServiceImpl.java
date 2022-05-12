package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.TradeDAO;
import com.example.domain.SellVO;

@Service
public class TradeServiceImpl implements TradeService{
	@Autowired
	TradeDAO dao;
	
	@Override
	public void insert(SellVO vo) {
		System.out.println("....." + vo.getSout() + "\n" + vo.getScode());
		dao.update(vo);
		dao.binsert(vo);
	}

	@Override
	public void sinsert(SellVO vo) {
		System.out.println("....." + vo.getBout() + "\n" + vo.getBcode());
		dao.update1(vo);
		dao.sinsert1(vo);
	}

}
