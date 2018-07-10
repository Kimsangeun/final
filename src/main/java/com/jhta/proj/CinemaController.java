package com.jhta.proj;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.proj.model.CinemaDAO;
import com.jhta.proj.model.CinemaVO;

@Controller
@RequestMapping("screen")
public class CinemaController {

	@Resource
	CinemaDAO dao;
	
	@ModelAttribute("top")
	public ArrayList top() {
		
		ArrayList<String> res = new ArrayList<String>();
		
		res.add("info");
		res.add("reservation"); //����
		res.add("movie"); //��ȭ
		res.add("screen"); //��ȭ������
		return res;
	}
	
	@ModelAttribute("data")
	public Object cine(Model model, CinemaVO vo) {
		
		Object res = null;
		
		res=dao.list(vo);
			
		return res;
	}
	
	@RequestMapping("/")
	public Object cine(Model model, @PathVariable(required=false) String menu, CinemaVO vo) {
		System.out.println("menu::"+menu);
		model.addAttribute("menu","screen");
	
		String mm = "";
		mm = "screenInfo";
		
		model.addAttribute("main", mm);
		return "home";
	}
	
	
}
