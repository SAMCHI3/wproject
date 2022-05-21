package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dao.MypageDAO;
import com.example.dao.ProductListDAO;
import com.example.dao.TradeDAO;
import com.example.domain.ApiVO;
import com.example.domain.BuyVO;
import com.example.domain.SellVO;
import com.example.service.TradeService;

@RequestMapping("/trade")
@Controller
public class TradeController {
	@Autowired
	TradeService service;
	
	@Autowired
	ProductListDAO dao;
	
	@Autowired
	TradeDAO tdao;
	
	@RequestMapping("/read")
	public String read(Model model,String pmodel, String ssize, String uid){
		model.addAttribute("vo", dao.readSize(pmodel,ssize,uid));
		model.addAttribute("pageName","trade/buy.jsp");
		return "/home";
	}
	
	@RequestMapping("/read1")
	public String read1(Model model,String pmodel,String uid){
		model.addAttribute("vo", dao.read1(pmodel));
		model.addAttribute("pageName","trade/buy.jsp");
		return "/home";
	}
	
	@RequestMapping("/insert")
	public String insert(Model model,String pmodel, String ssize, String uid){
		model.addAttribute("vo", dao.readSize(pmodel,ssize,uid));
		model.addAttribute("pageName","trade/insert.jsp");
		return "/home";
	}
	
	@RequestMapping("/insert1")
	public String insert1(Model model,String pmodel,String uid){
		model.addAttribute("vo", dao.read1(pmodel));
		model.addAttribute("pageName","trade/insert.jsp");
		return "/home";
	}
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public String binsert(SellVO vo){
		service.insert(vo);
		return "redirect:/";
	}
	
	@RequestMapping(value="/insert1", method=RequestMethod.POST)
	public String insert(SellVO vo){
		tdao.insert(vo);
		return "redirect:/";
	}
	
	@RequestMapping("/sinsert")
	public String sinsert(Model model,String pmodel,String bsize){
		model.addAttribute("vo", dao.buySize(pmodel, bsize));
		model.addAttribute("pageName","trade/sinsert.jsp");
		return "/home";
	}
	
	@RequestMapping("/sinsert1")
	public String sinsert1(Model model,String pmodel){
		model.addAttribute("vo", dao.read1(pmodel));
		model.addAttribute("pageName","trade/sinsert.jsp");
		return "/home";
	}
	
	@RequestMapping(value="/sinsert", method=RequestMethod.POST)
	public String sinsert(SellVO vo){
		service.sinsert(vo);
		return "redirect:/";
	}
	
	@RequestMapping(value="/sinsert1", method=RequestMethod.POST)
	public String sinsert1(SellVO vo){
		tdao.sinsert(vo);
		return "redirect:/";
	}
	
	@RequestMapping(value="/pinsert", method=RequestMethod.POST)
	public String pinsert(ApiVO vo){
		tdao.pinsert(vo);
		return "redirect:/";
	}
}
