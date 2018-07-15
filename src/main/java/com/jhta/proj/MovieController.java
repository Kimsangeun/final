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
import com.jhta.proj.model.ReserVO;
import com.jhta.proj.model.admin.MovieDAO;
import com.jhta.proj.model.admin.MovieVO;
import com.jhta.proj.model.admin.TimeTableVO;

@Controller
@RequestMapping("movie/{service}")
public class MovieController {

	@Resource
	MovDAO mdao;
	
	@Resource
	MovieDAO movieDao;
	
	@ModelAttribute("top")
	public ArrayList top() {
		
		ArrayList<String> res = new ArrayList<String>();
		
		res.add("info");
		res.add("reservation"); 
		res.add("movie");
		res.add("screen");
		return res;
	}
	
	
	@ModelAttribute("moviedata")
	public Object rese(Model model, MovVO vo,MovieVO mvo,@PathVariable String service) {
		Object res=null;
		
		switch (service) {
		case "now":
			res = movieDao.nowMovie();
			break;
		case "comming":
			res = movieDao.comingMovie();
			break;
					
		case "boxoffice":
			res = movieDao.boxoffice();
			break;

		default:
			break;
		}
		/*res = mdao.list(vo);*/
		
		return res;
	}
	
	
	@RequestMapping()
	public String cii(@PathVariable String service,MovVO vo,MovieVO mvo, Model model) {
		String res="home";
		
		model.addAttribute("menu","movie");
		model.addAttribute("main", service);
		return res;
	}
	
	//@RequestMapping("/")
	public Object cine(Model model, MovVO vo) {
	
		
		model.addAttribute("menu","movie");
	
		String mm = "";
		mm = "now";
		
		model.addAttribute("main", mm);
		return "home";
	}
}
