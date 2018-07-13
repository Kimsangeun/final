package com.jhta.proj;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.proj.model.CinemaVO;
import com.jhta.proj.model.MovDAO;
import com.jhta.proj.model.MovVO;
import com.jhta.proj.model.ReserDAO;
import com.jhta.proj.model.ReserVO;

@Controller
@RequestMapping("reservation")
public class ReserController {


	@Resource
	ReserDAO rdao;
	
	@Resource
	MovDAO mdao;
	
	@ModelAttribute("top")
	public ArrayList top() {
		
		ArrayList<String> res = new ArrayList<String>();
		
		res.add("info");
		res.add("reservation");
		res.add("movie"); 
		res.add("screen"); 
		return res;
	}
	
	@ModelAttribute("reserdata")
	public Object rese(Model model, ReserVO vo) {
		
		Object res=null;
		
		
		
		return res;
	}

	@ModelAttribute("moviedata")
	public Object mov(Model model, MovVO vo) {
		Object res=null;
		
		res = mdao.list(vo);
	
		return res;
	}
	
	@RequestMapping("/")
	public Object cine1(Model model, ReserVO vo) {
	
		model.addAttribute("menu","reservation");
	
		String mm = "reser";
		
		model.addAttribute("main", mm);
		return "home";
	}
	
	@RequestMapping("/reser")
	public Object cine2(Model model) {
		//System.out.println("service : "+service);
		model.addAttribute("menu","reservation");
	
		String mm = "reser";
		
		model.addAttribute("main", mm);
		return "home";
	}
	
	@RequestMapping("/timetable")
	public Object cine3(Model model) {
		
		model.addAttribute("menu","reservation");
		
		String mm = "timetable";
		
		
		model.addAttribute("main", mm);
		return "home";
	}
	
	@RequestMapping("/forbidden")
	public Object cine4(Model model) {
		
		model.addAttribute("menu","reservation");
		
		String mm = "forbidden";
		
		
		model.addAttribute("main", mm);
		return "home";
	}
}
