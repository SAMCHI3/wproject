package com.example.dao;

import java.util.List;

import com.example.domain.BuyVO;
import com.example.domain.Criteria;
import com.example.domain.ProductVO;
import com.example.domain.ProductVO1;
import com.example.domain.SellVO;

public interface MypageDAO {
	public List<BuyVO> blist(String bid);
	public List<BuyVO> blist1(String bid);
	public List<SellVO> slist(String sid);
	public List<SellVO> slist1(String sid);
	public List<ProductVO1> llist(String lid);
	public int count(String sid);
}
