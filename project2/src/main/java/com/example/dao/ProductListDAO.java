package com.example.dao;

import java.util.HashMap;
import java.util.List;

import com.example.domain.Criteria;
import com.example.domain.ProductVO;
import com.example.domain.ProductVO1;
import com.example.domain.ProductVO2;

public interface ProductListDAO {
	public List<ProductVO1> list(Criteria cri);
	public List<ProductVO1> list();
	public int count(Criteria cri);
	public ProductVO1 read(String pmodel,String uid);
	public ProductVO1 read1(String pmodel);
	public ProductVO1 read2(String pmodel,String uid, String lpcnt);
	public ProductVO readSize(String pmodel, String ssize, String uid);
	public ProductVO2 buySize(String pmodel, String bsize);
	public void insert(ProductVO vo);
	public void update(ProductVO vo);
	public void delete(String pmodel);
	public void plcount(String pmodel,ProductVO1 vo);
	public void plcountcancel(String pmodel, ProductVO1 vo);
	public List<HashMap<String, Object>> slist(String smodel);
	public List<HashMap<String, Object>> blist(String bmodel);
}
