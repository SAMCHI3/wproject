package com.example.controller;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dao.BoardDAO;
import com.example.dao.ReplyDAO;
import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.domain.ReplyVO;
import com.example.service.LikesService;

@Controller
@RequestMapping("/reply")
public class ReplyController {
	
	@Autowired
	ReplyDAO dao;
	
	@RequestMapping(value="/update1",method=RequestMethod.POST)
	public String lrupdate(ReplyVO vo, int rno){
		System.out.println(".........." + rno + "\n"+ vo.getRrlike());
		if(vo.getRrlike()==1){
			dao.rcount(rno, vo);
		}else if(vo.getRrlike()==0){
			dao.rcountcancel(rno, vo);
		}
		return "redirect:/";
	}
	
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	public String insert(ReplyVO vo,int bno,String bid){
		System.out.println("......" + vo.getRbno()+vo.getRid()+vo.getRcontent());
		dao.insert(vo);
		
		return "redirect:/board/read?bno=" + bno+"&bid="+bid;
	}
	
	@RequestMapping(value="/update",method = {RequestMethod.GET, RequestMethod.POST})
	public String update(ReplyVO vo){
		dao.update(vo);
		return "redirect:/board/list";
	}
	
	@RequestMapping(value="/delete",method = {RequestMethod.GET, RequestMethod.POST})
	public String delete(int rno){
		dao.delete(rno);
		
	return "redirect:/board/list";
	}
	
	
	@RequestMapping("/list.json")
	@ResponseBody
	public HashMap<String, Object> list(int rbno,Criteria cri){
		HashMap<String, Object> map= new HashMap<>();
//		cri.setPerPageNum(9);
//		PageMaker pm=new PageMaker();
//		pm.setCri(cri);
//		pm.setDisplayPageNum(5);
//		pm.setTotalCount(dao.count(cri, rbno));
		
//		map.put("pm", pm);
	map.put("list", dao.list(rbno));
		return map;
	}

}
