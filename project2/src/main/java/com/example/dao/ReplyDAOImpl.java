package com.example.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.net.ssl.SSLContext;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.Criteria;
import com.example.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO{
	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.ReplyMapper";
	
	@Override
	public List<ReplyVO> list(int rbno) {
		HashMap<String, Object> map=new HashMap<>();
//		map.put("cri", cri);
		map.put("rbno", rbno);
		return session.selectList(namespace + ".list",rbno);
	}

	@Override
	public void insert(ReplyVO vo) {
		session.insert(namespace + ".insert",vo);
		
	}

	@Override
	public void update(ReplyVO vo) {
		session.update(namespace + ".update",vo);
		
	}

	@Override
	public void delete(int rno) {
		session.delete(namespace + ".delete",rno);
		
	}

	@Override
	public int count(Criteria cri,int rbno) {
		HashMap<String, Object> cmap=new HashMap<>();
		cmap.put("rbno", rbno);
		cmap.put("cri", cri);
		return session.selectOne(namespace + ".count", cmap);
	}

	@Override
	public ReplyVO read(int rno) {
		
		return session.selectOne(namespace + ".read",rno);
	}
	
	@Override
	public void rcount(int rno, ReplyVO vo) {
		Map<String,Object> map=new HashMap<>();
		map.put("rno", rno);
		map.put("vo", vo);
		session.update(namespace+".rcount",map);
	}

	@Override
	public void rcountcancel(int rno, ReplyVO vo) {
		Map<String,Object> map=new HashMap<>();
		map.put("rno", rno);
		map.put("vo", vo);
		session.update(namespace+".rcountcancel",map);
	}

}
