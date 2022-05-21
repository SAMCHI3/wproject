package com.example.dao;

import java.util.List;

import com.example.domain.Criteria;
import com.example.domain.ReplyVO;

public interface ReplyDAO {
	public List<ReplyVO> list(int rbno);
	public void insert(ReplyVO vo);
	public void update(ReplyVO vo);
	public void delete(int rno);
	public int count(Criteria cri,int rbno);
	public ReplyVO read(int rno);
	public void rcount(int rno,ReplyVO vo);
	public void rcountcancel(int rno,ReplyVO vo);
}
