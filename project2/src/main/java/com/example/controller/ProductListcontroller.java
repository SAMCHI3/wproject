package com.example.controller;



import java.io.File;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.dao.CategoryDAO;
import com.example.dao.ProductListDAO;
import com.example.dao.TradeDAO;
import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.domain.ProductVO;
import com.example.domain.ProductVO1;
import com.example.domain.ProductVO2;
import com.example.domain.SellVO;
import com.example.service.LikesService;

@RequestMapping("/productList")
@Controller
public class ProductListcontroller {
	@Resource(name="uploadPath")
	String path;
	
	@Autowired
	LikesService service;
	
	@Autowired
	ProductListDAO dao;
	
	@Autowired
	CategoryDAO cdao;
	
	@Autowired
	TradeDAO tdao;
	
	@RequestMapping(value="/insert1",method=RequestMethod.POST)
	public String lpinsert(ProductVO1 vo,String pmodel,String lmodel,int lno,String uid,String lpcnt){
		service.lpinsert(vo,lmodel,pmodel,lno,lpcnt);
		return "redirect:/productList/read?pmodel=" + pmodel + "&uid=" + uid+"&lpcnt=" + lpcnt ;
	}
	
	@RequestMapping(value="/update1",method=RequestMethod.POST)
	public String lpupdate(ProductVO1 vo,int lno,String lid, String lmodel,String uid,String pmodel,String lpcnt){
		service.lpupdate(vo, pmodel, lmodel,lno,lpcnt);	
		return "redirect:/productList/read?pmodel=" + pmodel + "&uid=" + uid +"&lpcnt=" + lpcnt;
	}
	@RequestMapping(value="/update2",method=RequestMethod.POST)
	public String lpupdate1(ProductVO1 vo,int lno,String lid, String lmodel,String uid,String pmodel,String lpcnt){
		service.lpupdate1(vo, pmodel, lmodel, lno, lpcnt);
		return "redirect:/productList/read?pmodel=" + pmodel + "&uid=" + uid +"&lpcnt=" + lpcnt;
	}
	
	@RequestMapping("/read")
	public String read(Model model, String pmodel,String uid,String lpcnt){
		if(uid==null){
			System.out.println("아이디없음");
			model.addAttribute("vo", dao.read1(pmodel));
			model.addAttribute("pageName","productList/read.jsp");
		}
	else if(uid!=null){
		if(lpcnt==null){
				model.addAttribute("vo", dao.read(pmodel,uid));
				model.addAttribute("pageName","productList/read.jsp");
		}else if(lpcnt!=null){
			System.out.println("........");
			model.addAttribute("vo",dao.read2(pmodel,uid,lpcnt));
			model.addAttribute("pageName","productList/read.jsp");
			}
		}
	
		return "/home";
	}
	
//	@RequestMapping("/read")
//	public String read(Model model, String pmodel){
//		model.addAttribute("vo", dao.read(pmodel));
//		model.addAttribute("pageName","productList/read.jsp");
//		return "/home";
//	}
	
	@RequestMapping("/list")
	public String list(Model model){
		model.addAttribute("pageName","productList/list.jsp");
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
		map.put("ct", dao.list(cri));
		return map;
	}
	
	@RequestMapping("/category.json")
	@ResponseBody
	public Map<String,Object> categoryJSON(Criteria cri,String pcode,String pccode,String pbrand, String plprice, String plux){

		Map<String,Object> map=new HashMap<>();
		cri.setPerPageNum(9);
		
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setDisplayPageNum(10);
		pm.setTotalCount(cdao.pcount(cri));
		
		map.put("pm", pm);
		map.put("ct", cdao.plist(cri,pcode,pccode,pbrand,plprice,plux));
		return map;
	}
	
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	public String delete(String pmodel){
		dao.delete(pmodel);
		return "/home";
	}
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String updatePost(ProductVO vo,MultipartHttpServletRequest multi) throws Exception{
		
		//파일업로드
		MultipartFile file=multi.getFile("file");
		String categorypath="";
		if(vo.getPcode().equals("etc")) {
			if(vo.getPccode().equals("figure")){
				categorypath="etc/figure/";
			}
		}
		if(vo.getPcode().equals("etc")) {
			if(vo.getPccode().equals("figure")){
				categorypath="etc/figure/";
			}
		}
		if(vo.getPcode().equals("etc")) {
			if(vo.getPccode().equals("figure")){
				categorypath="etc/figure/";
			}
		}
		if(!file.isEmpty()){
			
			String image= "shop/"+categorypath + System.currentTimeMillis()+"_"+file.getOriginalFilename();
			file.transferTo(new File(path+image));
			vo.setPimage(image);
		}
			dao.update(vo);
		
		
		return "redirect:/productList/list";
	}
	
	@RequestMapping("/update")
	public String update(Model model,String pmodel){
		model.addAttribute("vo",dao.read1(pmodel));
		model.addAttribute("pageName","productList/update.jsp");
		return "/home";
	}
	
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	public String insertPost(ProductVO vo,MultipartHttpServletRequest multi) throws Exception{
		
		//파일업로드
		MultipartFile file=multi.getFile("file");
		String image= "shop/" + System.currentTimeMillis()+"_"+file.getOriginalFilename();
		file.transferTo(new File(path+image));
		vo.setPimage(image);
		dao.insert(vo);
		
		return "redirect:list";
	}


	@RequestMapping("/insert")
	public String insert(Model model){
		model.addAttribute("pageName","productList/insert.jsp");
		return "/home";
	}
	
	@RequestMapping("read.json")
	@ResponseBody
	public List<List<Object>> slist(String smodel){
		List<List<Object>> array=new ArrayList<>();
		List<HashMap<String, Object>> list=dao.slist(smodel);
		
		List<Object> arr=new ArrayList<>();
		arr.add("판매일");
		arr.add("판매가격");
		array.add(arr);
		
		for(Map<String,Object> map:list){
			arr=new ArrayList<>();
			int ssell1=Integer.parseInt((String) map.get("ssell"));
//			DecimalFormat df=new DecimalFormat("#,###");
//			int ssell1 = df.format(map.get("ssell"));
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			String strDate=sdf.format(map.get("sdate"));
			arr.add(strDate);
			arr.add(ssell1);
			array.add(arr);
		}
		return array;
	}
	
	@RequestMapping("read1.json")
	@ResponseBody
	public List<List<Object>> blist(String bmodel){
		List<List<Object>> array=new ArrayList<>();
		List<HashMap<String, Object>> list=dao.blist(bmodel);
		
		List<Object> arr=new ArrayList<>();
		arr.add("구매일");
		arr.add("구매가격");
		array.add(arr);
		
		for(Map<String,Object> map:list){
			arr=new ArrayList<>();
//			int buy=Integer.parseInt((String) map.get("bprice"));
//			DecimalFormat df=new DecimalFormat("#,###");
//			int ssell1 = df.format(map.get("ssell"));
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			String strDate=sdf.format(map.get("bdate"));
			arr.add(strDate);
			arr.add(map.get("bprice"));
			array.add(arr);
		}
		return array;
	}
}
