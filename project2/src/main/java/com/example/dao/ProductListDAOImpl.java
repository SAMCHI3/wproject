package com.example.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.Criteria;
import com.example.domain.ProductVO;
import com.example.domain.ProductVO1;
import com.example.domain.ProductVO2;

@Repository
public class ProductListDAOImpl implements ProductListDAO{
	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.ProductListMapper";
	@Override
	public List<ProductVO1> list(Criteria cri) {
		return session.selectList(namespace+".list",cri);
		
	}
	@Override
	public int count(Criteria cri) {
		return session.selectOne(namespace+".count",cri);
	}
	@Override
	public ProductVO1 read(String pmodel,String uid) {
		Map<String,Object> map=new HashMap<>();
		map.put("pmodel", pmodel);
		map.put("uid", uid);
		return session.selectOne(namespace+".read",map);
	}
	@Override
	public ProductVO readSize(String pmodel, String ssize, String uid) {
		Map<String,Object> map=new HashMap<>();
		map.put("pmodel", pmodel);
		map.put("ssize", ssize);
		map.put("uid", uid);
		return session.selectOne(namespace + ".readSize", map);
	}
	@Override
	public void insert(ProductVO vo) {
		session.insert(namespace+".insert",vo);
		
	}
	@Override
	public void update(ProductVO vo) {
		session.update(namespace+".update",vo);
		
	}
	@Override
	public void delete(String pmodel) {
		session.delete(namespace+".delete",pmodel);
		
	}
	@Override
	public void plcount(String pmodel, ProductVO1 vo) {
		Map<String,Object> map=new HashMap<>();
		map.put("pmodel", pmodel);
		map.put("vo", vo);
		session.update(namespace+".plcount",map);	
	}
	@Override
	public void plcountcancel(String pmodel, ProductVO1 vo) {
		Map<String,Object> map=new HashMap<>();
		map.put("pmodel", pmodel);
		map.put("vo",vo);
		session.update(namespace+".plcountcancel",map);
		
	}
	@Override
	public ProductVO2 buySize(String pmodel, String bsize) {
		Map<String,Object> map=new HashMap<>();
		map.put("pmodel", pmodel);
		map.put("bsize", bsize);
		return session.selectOne(namespace + ".readBuy", map);
	}
	@Override
	public ProductVO1 read1(String pmodel) {
		return session.selectOne(namespace+".read1",pmodel);
	}
	@Override
	public ProductVO1 read2(String pmodel, String uid, String lpcnt) {
		Map<String,Object> map=new HashMap<>();
		map.put("pmodel", pmodel);
		map.put("uid", uid);
		map.put("lpcnt", lpcnt);
		return session.selectOne(namespace+".read2",map);
	}
	@Override
	public List<ProductVO1> list() {
		return session.selectList(namespace+".list1");
	}
	@Override
	public List<HashMap<String, Object>> slist(String smodel) {
		return session.selectList(namespace + ".slist",smodel);
	}
	@Override
	public List<HashMap<String, Object>> blist(String bmodel) {
		return session.selectList(namespace + ".blist",bmodel);
	}
	
}
