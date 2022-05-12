package com.example.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dao.CategoryDAO;
import com.example.dao.MainProductDAO;
import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.domain.ProductVO;

@Controller
@RequestMapping("/product")
public class NewProductController {
	
	@Autowired
	MainProductDAO dao;
	@Autowired
	CategoryDAO cdao;
	
	@RequestMapping("/new")
	public String List(Model model){
		model.addAttribute("pageName", "main/new.jsp");
		return "/home";
	}
	
	@RequestMapping("/list3.json")
	@ResponseBody
	public Map<String,Object> list3JSON(Criteria cri){

		Map<String,Object> map=new HashMap<>();
		cri.setPerPageNum(8);
		
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(dao.count());
		
		map.put("pm", pm);
		map.put("list", dao.list(cri));
		return map;
	}
}
