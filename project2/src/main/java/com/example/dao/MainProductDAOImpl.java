package com.example.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.Criteria;
import com.example.domain.ProductVO;

@Repository
public class MainProductDAOImpl implements MainProductDAO{
	
	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.MainProductMapper";
	
	@Override
	public List<ProductVO> list(Criteria cri) {
		return session.selectList(namespace + ".list", cri);
	}

	@Override
	public List<ProductVO> list2(Criteria cri) {
		return session.selectList(namespace + ".list2", cri);
	}

	@Override
	public int count() {
		return session.selectOne(namespace + ".count");
	}

}
