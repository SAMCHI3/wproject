package com.example.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dao.ApiDAO;
import com.example.domain.ApiVO;
import com.example.domain.Criteria;
import com.example.domain.PageMaker;

@Controller
@RequestMapping("/manager")
public class ApiController {
	
	@Autowired
	ApiDAO dao;
	
	@RequestMapping("/list")
	public String list(Model model){
		model.addAttribute("pageName","user/payment.jsp");
		return "/home";
	}
	
	@RequestMapping("/list.json")
	@ResponseBody
	public Map<String, Object> listJSON(Criteria cri){
		Map<String, Object> map = new HashMap<String, Object>();
	      cri.setPerPageNum(5);
	      
	      PageMaker pm = new PageMaker();
	      pm.setCri(cri);
	      pm.setDisplayPageNum(4);
	      pm.setTotalCount(dao.count(cri));
	      
	      map.put("pm", pm);
	      map.put("list", dao.list(cri));
	      return map;
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	@ResponseBody
	public void update(ApiVO vo){
		System.out.println("......" + vo.getDel() + "\n" + vo.getAno());
		dao.update(vo);
	}
	
	@RequestMapping(value="/update1", method=RequestMethod.POST)
	@ResponseBody
	public void update1(ApiVO vo){
		dao.update1(vo);
	}
	
}
