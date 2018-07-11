package com.jhta.proj;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jhta.proj.model.CinemaDAO;
import com.jhta.proj.model.CinemaVO;
import com.jhta.proj.model.admin.TimeTableVO;

@Controller
@RequestMapping("screen/{service}")
public class CinemaController {

	@Resource
	CinemaDAO dao;
	
	/*@ModelAttribute("top")
	public ArrayList top() {
		
		ArrayList<String> res = new ArrayList<String>();
		
		res.add("info");
		res.add("reservation"); //����
		res.add("movie"); //��ȭ
		res.add("screen"); //��ȭ������
		return res;
	}*/
	
	@ModelAttribute("cinemadata")
	public Object cine(Model model, CinemaVO vo) {
		
		Object res = null;
		
		res=dao.list(vo);
			
		return res;
	}
	
	//@RequestMapping("/")
	public Object cine(Model model, @PathVariable(required=false) String menu, CinemaVO vo) {
		System.out.println("menu::"+menu);
		model.addAttribute("menu","screen");
	
		String mm = "";
		mm = "screenInfo";
		
		model.addAttribute("main", mm);
		return "home";
	}
	
	
	@RequestMapping()
	String selectList(@PathVariable String service, TimeTableVO vo, Model model) {
		
		
		String res = "screen/"+service;
//		System.out.println(vo);
		System.out.println("안녕하세요");
		model.addAttribute("main", service);
		model.addAttribute("menu", "screen");
		System.out.println("포비든킹덤");

		return "home";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	String sss(@PathVariable String service, TimeTableVO vo,BindingResult errors) {
		

		System.out.println("포스트");
		String res = "home";


		if(service.equals("insert")) {
			res = "screen/alert";

		}
		

		return res;
	}
	
	
}
