package com.example.dao;

import java.util.List;

import com.example.domain.Criteria;
import com.example.domain.ProductVO;

public interface MainProductDAO {
	public List<ProductVO> list(Criteria cri);
	public List<ProductVO> list2(Criteria cri);
	public int count();
}
