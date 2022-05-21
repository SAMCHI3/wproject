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
	public List<SellVO> slist10(String sid);
   public List<SellVO> slist11(String sid);
   public List<SellVO> slist12(String sid);
   public List<BuyVO> blist20(String bid);
   public List<BuyVO> blist21(String bid);
   public List<BuyVO> blist22(String bid);
   public int count1(String bid);
   public int count2(String bid);
   public int count3(String sid);
   public int count4(String sid);
}
