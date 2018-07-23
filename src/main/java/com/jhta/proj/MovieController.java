package com.jhta.proj;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jhta.proj.model.CinemaVO;
import com.jhta.proj.model.MovDAO;
import com.jhta.proj.model.MovVO;
import com.jhta.proj.model.ReserVO;
import com.jhta.proj.model.admin.MovieDAO;
import com.jhta.proj.model.admin.MovieVO;
import com.jhta.proj.model.admin.ReviewVO;
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
	public Object rese(Model model, MovVO vo,MovieVO mvo,ReviewVO rvo,@PathVariable String service) {
		Object res=null;
		
		
		switch (service) {
		case "now":
			res = movieDao.nowMovie();
			break;
		case "comming":
			System.out.println("자르잘");
			res = movieDao.comingMovie();
			System.out.println(res);
			break;
					
		case "boxoffice":
			res = movieDao.boxoffice();
			break;
			
		case "detailMovie":
			HashMap<String, Object> map = new HashMap<>();
			System.out.println(mvo);
			res = movieDao.detailMovie(mvo);
			System.out.println(res);
			map.put("movie", res);
			res = movieDao.review(mvo);	//리뷰
			System.out.println(res);
			map.put("review", res);
			res = map;
			System.out.println(res);
			//System.out.println(res);
			//리뷰를 붙이자
			
		default:
			break;
		}
		/*res = mdao.list(vo);*/
		
		return res;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String ciiPost(@PathVariable String service,ReviewVO rvo, Model model) {
		System.out.println(rvo);
		if(service.equals("reviewInsert")) {
			
			movieDao.reviewInsert(rvo);
			movieDao.scoreUpdate(rvo);
		}
		if(service.equals("deleteReview")) {
			
			movieDao.reviewDelete(rvo);
			movieDao.scoreUpdate(rvo);
			
		}
		return "redirect:detailMovie?mid="+rvo.getMid();
	}
	
	@RequestMapping()
	public String cii(@PathVariable String service,MovVO vo,ReviewVO rvo,MovieVO mvo, Model model) {
		String res="home";
		
		model.addAttribute("menu","movie");
		model.addAttribute("main", service);
		
		if(service.equals("reviewInsert")) {
			
			model.addAttribute("main", "");
		}
		return res;
	}
	
}
