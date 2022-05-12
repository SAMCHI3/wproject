package com.example.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.Criteria;
import com.example.domain.ProductVO;

@Repository
public class CategoryDAOImpl implements CategoryDAO{
	
	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.CategoryMapper";

	@Override
	public List<ProductVO> plist(Criteria cri, String pcode, String pccode, String pbrand, String plprice, String plux) {
		HashMap<String,Object> map=new HashMap<>();
		map.put("cri", cri);
		map.put("pcode", pcode);
		map.put("pccode", pccode);
		map.put("pbrand", pbrand);
		map.put("plprice", plprice);
		map.put("plux", plux);
		return session.selectList(namespace + ".plist", map);
	}

	@Override
	public int pcount(Criteria cri) {
		return session.selectOne(namespace + ".pcount", cri);
	}

}
