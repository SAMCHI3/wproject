package com.example.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.BuyVO;
import com.example.domain.Criteria;
import com.example.domain.ProductVO1;
import com.example.domain.SellVO;

@Repository
public class MypageDAOImpl implements MypageDAO{

	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.MypageMapper";
	
	@Override
	public List<SellVO> slist(String sid) {
		return session.selectList(namespace + ".slist", sid);
	}

	@Override
	public int count(String sid) {
		return session.selectOne(namespace + ".count", sid);
	}

	@Override
	public List<BuyVO> blist(String bid) {
		return session.selectList(namespace + ".blist", bid);
	}

	@Override
	public List<SellVO> slist1(String sid) {
		return session.selectList(namespace + ".slist1", sid);
	}

	@Override
	public List<BuyVO> blist1(String bid) {
		return session.selectList(namespace + ".blist1", bid);
	}

	@Override
	public List<ProductVO1> llist(String lid) {
		return session.selectList(namespace + ".llist", lid);
	}

	
	
}
