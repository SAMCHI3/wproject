package com.example.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.LikesVO;

@Repository
public class LikesDAOImpl implements LikesDAO{
	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.LikesMapper";
	
	@Override
	public void lpupdate(LikesVO vo,String lmodel, int lno,String lpcnt) {
		Map<String,Object> map=new HashMap<>();
		map.put("vo", vo);
		map.put("lmodel", lmodel);
		map.put("lno", lno);
		map.put("lpcnt", lpcnt);
		session.update(namespace+".lpupdate",map);
		
	}

	@Override
	public void insert(LikesVO vo) {
		session.insert(namespace+".lpinsert",vo);		
	}

	@Override
	public void lpupdate1(LikesVO vo, String lmodel, int lno, String lpcnt) {
		Map<String,Object> map=new HashMap<>();
		map.put("vo", vo);
		map.put("lmodel", lmodel);
		map.put("lno", lno);
		map.put("lpcnt", lpcnt);
		session.update(namespace+".lpupdate1",map);
		
	}
	
	@Override
	public void lbupdate(LikesVO vo, String lbno, int lno, String lbcnt) {
		Map<String,Object> map=new HashMap<>();
		map.put("vo", vo);
		map.put("lbno", lbno);
		map.put("lno", lno);
		map.put("lbcnt", lbcnt);
		session.update(namespace+".lbupdate",map);
		
	}

	@Override
	public void lbinsert(LikesVO vo) {
		session.insert(namespace+".lbinsert",vo);		
		
	}

	@Override
	public void lbupdate1(LikesVO vo, String lbno, int lno, String lbcnt) {
		Map<String,Object> map=new HashMap<>();
		map.put("vo", vo);
		map.put("lbno", lbno);
		map.put("lno", lno);
		map.put("lbcnt", lbcnt);
		session.update(namespace+".lbupdate1",map);
		
	}

}
