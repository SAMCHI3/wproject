package com.example.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.ChatVO;

@Repository
public class ChatDAOImpl implements ChatDAO{
	
	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.ChatMapper";
	
	@Override
	public List<ChatVO> list(String uid) {
		return session.selectList(namespace + ".list",uid);
	}

	@Override
	public void insert(ChatVO vo) {
		session.insert(namespace + ".insert", vo);
	}

	@Override
	public void delete(int id) {
		session.delete(namespace + ".delete", id);
	}

	@Override
	public List<ChatVO> list2() {
		return session.selectList(namespace + ".list2");
	}

}
