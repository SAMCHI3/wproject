package com.example.dao;

import java.util.List;

import com.example.domain.ChatVO;

public interface ChatDAO {
	public List<ChatVO> list(String uid);
	public List<ChatVO> list2();
	public void insert(ChatVO vo);
	public void delete(int id);
}
