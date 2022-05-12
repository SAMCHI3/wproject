package com.example.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.domain.Criteria;
import com.example.domain.ProductVO;

public interface CategoryDAO {
	public List<ProductVO> plist(Criteria cri, String pcode, String pccode, String pbrand, String plprice, String plux);
	public int pcount(Criteria cri);
}
