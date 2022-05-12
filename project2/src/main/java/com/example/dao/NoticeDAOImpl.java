package com.example.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.Criteria;
import com.example.domain.NoticeVO;
import com.example.domain.UserVO;

@Repository
public class NoticeDAOImpl implements NoticeDAO{
	@Autowired
	SqlSession session;
	
	String namespace="com.example.mapper.NoticeMapper";
	@Override
	public List<NoticeVO> noticelist(Criteria cri,String ncode1, String ncode2) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("ncode1", ncode1);
		map.put("ncode2", ncode2);
		map.put("cri", cri);
		return session.selectList(namespace + ".noticelist",map);
	}
	@Override
	public int noticetotal() {

		return session.selectOne(namespace + ".noticetotal");
	}
	@Override
	public NoticeVO noticeread(String ncount) {
		return session.selectOne(namespace + ".noticeread",ncount);
	}
	@Override
	public void insert(NoticeVO vo) {
		session.insert(namespace + ".insert",vo);
		
	}
	@Override
	public void update(NoticeVO vo) {
		session.update(namespace + ".update",vo);
		
	}
	@Override
	public void delete(int ncount) {
		session.delete(namespace + ".delete", ncount);
		
	}
	
	
	



}
