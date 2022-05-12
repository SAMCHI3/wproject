package com.example.dao;

import java.util.List;

import com.example.domain.BoardVO;
import com.example.domain.Criteria;

public interface BoardDAO {
	public List<BoardVO> list(Criteria cri);
	public int count(Criteria cri);
	public BoardVO read(int bno);
	public void insert(BoardVO vo);
	public List<BoardVO> top(Criteria cri);
	public List<BoardVO> list1(String bid);
	public void update(BoardVO vo);
	public void delete(int bno);
	public void bcount(BoardVO vo, int bno);
	public void blcount(int bno,BoardVO vo);
	public void blcountcancel(int bno,BoardVO vo);
//	public List<BoardVO> list2(String bcode1,String bcode2,String bcode3,String bcode4,String bcode5);
//	public int count1(String bid);
}
