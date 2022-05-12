package com.example.dao;

import com.example.domain.ApiVO;
import com.example.domain.BuyVO;
import com.example.domain.SellVO;

public interface TradeDAO {
	public void update1(SellVO vo);
	public void insert(SellVO vo);
	public void binsert(SellVO vo);
	public void sinsert(SellVO vo);
	public void sinsert1(SellVO vo);
	public void update(SellVO vo);
	public void pinsert(ApiVO vo);
}
