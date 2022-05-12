package com.example.controller;

import java.io.File;
import java.lang.ProcessBuilder.Redirect;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.SystemPropertyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.dao.BoardDAO;
import com.example.domain.BoardVO;
import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.domain.UserVO;
import com.example.service.LikesService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Resource(name="uploadPath")
	String path;
	@Autowired
	LikesService service;
	@Autowired
	BoardDAO dao;
	
	@RequestMapping(value="/insert1",method=RequestMethod.POST)
	public String lbinsert(BoardVO vo,int lbno){
		service.lbinsert(vo,lbno);
		return "redirect:/board/list";
	}
	
	@RequestMapping(value="/update1",method=RequestMethod.POST)
	public String lbupdate(BoardVO vo,int lno,String lbno,String uid,int bno,String lbcnt){
		service.lbupdate(vo, bno, lbno,lno,lbcnt);	
		return "redirect:/board/list";
	}
	@RequestMapping(value="/update2",method=RequestMethod.POST)
	public String lbupdate1(BoardVO vo,int lno,String lbno,String uid,int bno,String lbcnt){
		service.lbupdate1(vo, bno, lbno, lno, lbcnt);
		return "redirect:/board/list";
	}
	
	@RequestMapping("/delete")
	public String delete(int bno){
		dao.delete(bno);	
		return "/board/list";
	}
	
	@RequestMapping("/update")
	public void update(Model model,int bno){
		model.addAttribute("vo",dao.read(bno));
		model.addAttribute("pageName","board/update.jsp");
		
	}
	@RequestMapping(value="/update",method=RequestMethod.POST)
    public String updatePost(BoardVO vo,MultipartHttpServletRequest multi) throws Exception{
       
       //파일업로드
       MultipartFile file=multi.getFile("file");
   
       if(!file.isEmpty()){
    	   new File(path+vo.getBimage()).delete();
	       String image= "board/" + System.currentTimeMillis()+"_"+file.getOriginalFilename();
	       file.transferTo(new File(path+image));
	       vo.setBimage(image);
       }
       
   
       dao.update(vo);
       
       return "redirect:/board/list";
 }
	
	
	
	
	@RequestMapping("/insert")
	public String insert(Model model){
		model.addAttribute("pageName","board/insert.jsp");
		return "/home";
	}
	
	@RequestMapping("/list1.json")
	@ResponseBody
	public HashMap<String, Object> list1Json(String bid){
		HashMap<String, Object> map=new HashMap<>();
		List<BoardVO> arr=new ArrayList<>();
		arr.addAll(dao.list1(bid));
		
		
		int[] arrsize=new int[arr.size()];
		for(int i=0; i<=arr.size(); i++){
			arrsize[i]= i +1;
			
		}
		
		map.put("list1", arrsize);
		return map;
	}
	
	
	@RequestMapping(value="/insert",method=RequestMethod.POST)
    public String insertPost(BoardVO vo,MultipartHttpServletRequest multi) throws Exception{
       System.out.println("........" + vo.toString());
       //파일업로드
       MultipartFile file=multi.getFile("file");
       String image= "board/" + System.currentTimeMillis()+"_"+file.getOriginalFilename();
       file.transferTo(new File(path+image));
       vo.setBimage(image);
       dao.insert(vo);
       return "redirect:/board/list";
 }
	
	@RequestMapping("/read")
	public String read(Model model, int bno){
		model.addAttribute("vo",dao.read(bno));
		model.addAttribute("pageName","board/read.jsp");
		return "/home";
	}
	
	@RequestMapping("/list")
	public String list(Model model){
		model.addAttribute("pageName","board/list.jsp");
		return "/home";
	}
	
	@RequestMapping("/top")
	   public String top(Model model){
	      model.addAttribute("pageName","board/top.jsp");
	      return "/home";
	}
	
	@RequestMapping("/list.json")
	@ResponseBody
	public HashMap<String, Object> listJson(Criteria cri){
		HashMap<String, Object> map=new HashMap<>();
		cri.setPerPageNum(9);
		PageMaker pm= new PageMaker();
		pm.setCri(cri);
		pm.setDisplayPageNum(10);
		pm.setTotalCount(dao.count(cri));
	
		map.put("pm", pm);
		map.put("list", dao.list(cri));
		return map;
	}
	
//	@RequestMapping("/list2.json")
//	@ResponseBody
//	public HashMap<String, Object> list2Json(String bcode1, String bcode2, String bcode3, String bcode4, String bcode5){
//		HashMap<String, Object> map=new HashMap<>();
//		map.put("list2", dao.list2(bcode1,bcode2,bcode3,bcode4,bcode5));
//		return map;
//	}
	
	@RequestMapping("/top.json")
	@ResponseBody
	public HashMap<String, Object> topJson(Criteria cri){
		HashMap<String, Object> map=new HashMap<>();
		cri.setPerPageNum(9);
		PageMaker pm= new PageMaker();
		pm.setCri(cri);
		pm.setDisplayPageNum(10);
		pm.setTotalCount(dao.count(cri));
	
		map.put("pm", pm);
		map.put("top", dao.top(cri));
		return map;
	}
}
