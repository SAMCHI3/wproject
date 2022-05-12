package com.example.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.dao.MainProductDAO;
import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.domain.ProductVO;

@RestController
@RequestMapping("/product")
public class MainProductController {
	@Autowired
	MainProductDAO dao;

	
	@RequestMapping("/list.json")
	public Map<String,Object> listJSON(Criteria cri){

		Map<String,Object> map=new HashMap<>();
		cri.setPerPageNum(8);
		
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(3);
		
		map.put("pm", pm);
		map.put("list", dao.list(cri));
		return map;
	}
	
	@RequestMapping("/list2.json")
	public Map<String,Object> list2JSON(Criteria cri){
		int no=1;

		Map<String,Object> map=new HashMap<>();
		cri.setPerPageNum(8);
		
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(3);
		
		for(no=1; no<9; no++){
			map.put("no", no);
		}
		map.put("pm", pm);
		map.put("list2", dao.list2(cri));
		return map;
	}
}
