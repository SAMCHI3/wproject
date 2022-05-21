package com.example.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.omg.CORBA.Object;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.ApiVO;
import com.example.domain.Criteria;

@Repository
public class ApiDAOImpl implements ApiDAO{
	
	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.ApiMapper";
	
	@Override
	public List<ApiVO> list(Criteria cri) {
		return session.selectList(namespace + ".list", cri);
	}

	@Override
	public int count(Criteria cri) {
		return session.selectOne(namespace + ".count");
	}

	@Override
	public void update(ApiVO vo) {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void update1(ApiVO vo) {
		session.update(namespace + ".update1", vo);
	}

}
