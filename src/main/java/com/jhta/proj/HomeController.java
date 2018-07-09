package com.jhta.proj;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	//private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
/*	@RequestMapping("/")
	public String home(Locale locale, Model model) {
		//logger.info("Welcome home! The client locale is {}.", locale);
		System.out.println("menu:");
		System.out.println("maain:");

//		System.out.println("menu:" + menu);
//		System.out.println("main:" + main);
		model.addAttribute("menu","inc");
		model.addAttribute("main","main");
		
		return "home";
	}*/
	
	
	@ModelAttribute("top")
	public ArrayList top() {
		
		ArrayList<String> res = new ArrayList<String>();
		
		res.add("info");
		res.add("reservation"); //예매
		res.add("movie"); //영화
		res.add("screen"); //영화관정보
		return res;
	}
	
	@ModelAttribute("side")
	public ArrayList side(@PathVariable(required=false) String menu) {
		
		//System.out.println(menu);
		
		HashMap<String, ArrayList<String>> map = new HashMap<String, ArrayList<String>>();
		
		ArrayList<String> info = new ArrayList<String>();
		
		info.add("notice"); //공지사항
		info.add("faq"); //자주하는질문
		info.add("qna"); //1:1문의
		
		map.put("info", info);
		
		ArrayList<String> reservation = new ArrayList<String>();
		
		reservation.add("reser"); //예매
		reservation.add("timetable"); //상영시간표
		
		map.put("reservation", reservation);

		ArrayList<String> movie = new ArrayList<String>();
		
		movie.add("boxoffice"); //박스오피스
		movie.add("now"); //현재상영작
		movie.add("comming"); //개봉예정작
		
		map.put("movie", movie);
		
		ArrayList<String> screen = new ArrayList<String>();
		
		map.put("screen", screen);
		
		return map.get(menu);
	}

	@RequestMapping(value="/", method = RequestMethod.GET)
	public String view3(Model model) {
		model.addAttribute("menu","menu");
		return "home";
	}

	@RequestMapping("{menu}")
	public String view1(Model model, @PathVariable String menu) {
		System.out.println("menu::"+menu);
		model.addAttribute("menu",menu);
		
		String mm = "";
		
		switch(menu) {
		
		case "info":
			mm = "notice";
			break;
		
		case "reservation":
			mm = "reser";
			break;
			
		case "movie":
			mm = "boxoffice";
			break;
			
		case "screen":
			mm = "screenInfo";
			break;
			
		}
		model.addAttribute("main", mm);
		return "home";
	}
	
	@RequestMapping("{menu}/{main}")
	public String view2(Model model, @PathVariable String menu, @PathVariable String main) {
//		System.out.println("menu::"+menu);
//		System.out.println("main::"+main);
		model.addAttribute("menu", menu);
		model.addAttribute("main", main);
		return "home";
	}
}
