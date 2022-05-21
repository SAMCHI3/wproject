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

	   @Override
	   public List<SellVO> slist10(String sid) {
	      return session.selectList(namespace + ".slist10", sid);
	   }

	   @Override
	   public List<SellVO> slist11(String sid) {
	      return session.selectList(namespace + ".slist11", sid);
	   }
	   
	   @Override
	   public List<SellVO> slist12(String sid) {
	      return session.selectList(namespace + ".slist12", sid);
	   }

	   @Override
	   public List<BuyVO> blist20(String bid) {
	      return session.selectList(namespace+ ".blist20",bid);
	   }

	   @Override
	   public List<BuyVO> blist21(String bid) {
	      return session.selectList(namespace+ ".blist21",bid);
	   }

	   @Override
	   public List<BuyVO> blist22(String bid) {
	      return session.selectList(namespace+ ".blist22",bid);
	   }

	@Override
	public int count1(String bid) {
		return session.selectOne(namespace + ".bcount", bid);
	}

	@Override
	public int count2(String bid) {
		return session.selectOne(namespace + ".bcount1", bid);
	}

	@Override
	public int count3(String sid) {
		return session.selectOne(namespace + ".scount", sid);
	}

	@Override
	public int count4(String sid) {
		return session.selectOne(namespace + ".scount1", sid);
	}
	   
	
}
