package com.example.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.dao.NoticeDAO;
import com.example.domain.BoardVO;
import com.example.domain.Criteria;
import com.example.domain.NoticeVO;
import com.example.domain.PageMaker;
import com.example.domain.ProductVO;
import com.example.domain.UserVO;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	@Autowired
	NoticeDAO dao;;
	
		
	@RequestMapping("/home")
	public String home(Model model){
		model.addAttribute("pageName","notice/home.jsp");
		return "/home";
	}
	@RequestMapping("/insert")
	public String insert(Model model){
		model.addAttribute("pageName","notice/hinsert.jsp");
		return "/home";
	}
	
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	public String insertPost(NoticeVO vo){
			dao.insert(vo);
		return "redirect:/notice/home";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updatePost(NoticeVO vo) throws Exception {
		System.out.println("..............."+ vo.toString());
		dao.update(vo);
		return "redirect:/notice/home";
	}
	
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	public String delete(int ncount){
		dao.delete(ncount);
		return "redirect:/notice/home";
	}
	
	
	
	
	
	@RequestMapping("/list.json")
	@ResponseBody
	public Map<String, Object> listJSON(Criteria cri,String ncode1, String ncode2){
		Map<String, Object> map = new HashMap<String, Object>();
		cri.setPerPageNum(5);
		
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setDisplayPageNum(4);
		pm.setTotalCount(dao.noticetotal());
		
		map.put("pm", pm);
		map.put("list", dao.noticelist(cri,ncode1,ncode2));
		return map;
	}
	
	@RequestMapping("/read")
	public String noticeread(Model model,String ncount){
		model.addAttribute("vo", dao.noticeread(ncount));
		model.addAttribute("pageName","notice/homenotice.jsp");
		return "/home";
	}
	@RequestMapping("/read2")
	public String nfaqread(Model model,String ncount){
		model.addAttribute("vo", dao.noticeread(ncount));
		model.addAttribute("pageName","notice/homenfaq.jsp");
		return "/home";
	}
	@RequestMapping("/read3")
	public String nporead(Model model,String ncount){
		model.addAttribute("vo", dao.noticeread(ncount));
		model.addAttribute("pageName","notice/homenpo.jsp");
		return "/home";
	}
	
	
	@RequestMapping("/nfaq")
	public String nfap(Model model){
		model.addAttribute("pageName", "notice/nfaq.jsp");
		return "/home";
	}
	
	@RequestMapping("/nfaq2")
	public String nfap2(Model model){
		model.addAttribute("pageName", "notice/nfaq2.jsp");
		return "/home";
	}
	@RequestMapping("/nfaq3")
	public String nfap3(Model model){
		model.addAttribute("pageName", "notice/nfaq3.jsp");
		return "/home";
	}
	@RequestMapping("/nfaq4")
	public String nfap4(Model model){
		model.addAttribute("pageName", "notice/nfaq4.jsp");
		return "/home";
	}
	
	@RequestMapping("/npo")
	public String npo(Model model){
		model.addAttribute("pageName", "notice/npo.jsp");
		return "/home";
	}
	
	@RequestMapping("/npo2")
	public String npo2(Model model){
		model.addAttribute("pageName", "notice/npo2.jsp");
		return "/home";
	}
	@RequestMapping("/npo3")
	public String npo3(Model model){
		model.addAttribute("pageName", "notice/npo3.jsp");
		return "/home";
	}
	@RequestMapping("/npo4")
	public String npo4(Model model){
		model.addAttribute("pageName", "notice/npo4.jsp");
		return "/home";
	}
	@RequestMapping("/npo5")
	public String npo5(Model model){
		model.addAttribute("pageName", "notice/npo5.jsp");
		return "/home";
	}
	@RequestMapping("/npo6")
	public String npo6(Model model){
		model.addAttribute("pageName", "notice/npo6.jsp");
		return "/home";
	}
	@RequestMapping("/npo7")
	public String npo7(Model model){
		model.addAttribute("pageName", "notice/npo7.jsp");
		return "/home";
	}
	
	
	
}
