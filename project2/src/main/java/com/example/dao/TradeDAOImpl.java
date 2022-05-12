package com.example.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.ApiVO;
import com.example.domain.BuyVO;
import com.example.domain.SellVO;

@Repository
public class TradeDAOImpl implements TradeDAO{

	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.TradeMapper";
	
	
	@Override
	public void binsert(SellVO vo) {
		session.insert(namespace + ".binsert", vo);
	}


	@Override
	public void sinsert(SellVO vo) {
		session.insert(namespace + ".sinsert", vo);
	}


	@Override
	public void update(SellVO vo) {
		session.update(namespace + ".update", vo);
	}


	@Override
	public void insert(SellVO vo) {
		session.insert(namespace + ".binsert", vo);
	}


	@Override
	public void update1(SellVO vo) {
		session.update(namespace + ".update1", vo);
	}


	@Override
	public void sinsert1(SellVO vo) {
		session.insert(namespace + ".sinsert", vo);
	}


	@Override
	public void pinsert(ApiVO vo) {
		session.insert(namespace + ".pinsert", vo);
	}

}
