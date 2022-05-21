package com.example.dao;

import java.util.List;

import com.example.domain.ApiVO;
import com.example.domain.Criteria;

public interface ApiDAO {
	public List<ApiVO> list(Criteria cri);
	public int count(Criteria cri);
	public void update(ApiVO vo);
	public void update1(ApiVO vo);
}
