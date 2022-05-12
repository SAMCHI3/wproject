package com.example.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.BoardVO;
import com.example.domain.Criteria;

@Repository
public class BoardDAOImpl implements BoardDAO{
	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.BoardMapper";
	
	@Override
	public List<BoardVO> list(Criteria cri) {
		return session.selectList(namespace+".list",cri);
	}

	@Override
	public int count(Criteria cri) {
		return session.selectOne(namespace+".count",cri);
	}

	@Override
	public BoardVO read(int bno) {
		return session.selectOne(namespace+".read",bno);
	}

	@Override
	public void insert(BoardVO vo) {
		session.insert(namespace + ".insert", vo);
		
	}

	@Override
	   public List<BoardVO> top(Criteria cri) {
	      return session.selectList(namespace+".top",cri);
	}

	@Override
	public List<BoardVO> list1(String bid) {
//		Map<String,Object> map=new HashMap<String,Object>();
//		map.put("bid", bid);
		return session.selectList(namespace+".list1",bid);
	}

//	@Override
//	public List<BoardVO> list2(String bcode1, String bcode2, String bcode3, String bcode4, String bcode5) {
//		Map<String,Object> map=new HashMap<String,Object>();
//		map.put("bcode1", bcode1);
//		map.put("bcode2", bcode2);
//		map.put("bcode3", bcode3);
//		map.put("bcode4", bcode4);
//		map.put("bcode5", bcode5);
//		return session.selectList(namespace + ".list2", map);
//	}

//	@Override
//	public int count1(String bid) {
//		return session.selectOne(namespace+".count1",bid);
//	}

	@Override
	public void update(BoardVO vo) {
		session.update(namespace + ".update",vo);
		
	}

	@Override
	public void delete(int bno) {
		session.delete(namespace + ".delete",bno);
		
	}

	@Override
	public void bcount(BoardVO vo, int bno) {
		session.update(namespace+".bcount",vo);
		
	}

	@Override
	public void blcount(int bno, BoardVO vo) {
		Map<String,Object> map=new HashMap<>();
		map.put("bno", bno);
		map.put("vo", vo);
		session.update(namespace+".blcount",map);	
		
	}

	@Override
	public void blcountcancel(int bno, BoardVO vo) {
		Map<String,Object> map=new HashMap<>();
		map.put("bno", bno);
		map.put("vo", vo);
		session.update(namespace+".blcountcancel",map);	
		
	}

}
