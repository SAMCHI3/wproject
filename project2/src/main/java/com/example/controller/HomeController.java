package com.example.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.dao.UserDAO;
import com.example.domain.UserVO;


@Controller
public class HomeController {
	@Autowired
	UserDAO dao;
	
	@Autowired
	BCryptPasswordEncoder passEncoder;
	
	@Resource(name="uploadPath")
	String path;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		model.addAttribute("pageName", "about.jsp");
		return "home";
	}
	
	@RequestMapping(value = "/chat", method = RequestMethod.GET)
	public String chat(Locale locale, Model model) {
		return "chat";
	}
	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String my(Locale locale, Model model) {
		return "mypage";
	}
	
	@RequestMapping("/delete")
	public String update(Model model, String uid){
		model.addAttribute("vo", dao.read(uid));
		model.addAttribute("pageName", "delete.jsp");
		return "/home";
	}
 
	 @RequestMapping(value="/update", method=RequestMethod.POST)
	public String updatePost(UserVO vo, MultipartHttpServletRequest multi,HttpSession session) throws Exception{
		 session.invalidate();
			
		dao.delete(vo);
		return "redirect:/";
	}
}
