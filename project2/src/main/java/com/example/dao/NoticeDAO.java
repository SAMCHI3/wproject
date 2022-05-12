package com.example.dao;

import java.util.List;

import com.example.domain.Criteria;
import com.example.domain.NoticeVO;
import com.example.domain.UserVO;


public interface NoticeDAO {
	public List<NoticeVO> noticelist(Criteria cri,String ncode1,String ncode2);
	public int noticetotal();
	public NoticeVO noticeread(String ncount);
	public void insert(NoticeVO vo); 
	public void update(NoticeVO vo);
	public void delete(int ncount);
}
