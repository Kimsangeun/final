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
		res.add("reservation"); //����
		res.add("movie"); //��ȭ
		res.add("screen"); //��ȭ������
		return res;
	}
	
	@ModelAttribute("side")
	public ArrayList side(@PathVariable(required=false) String menu) {
		
		//System.out.println(menu);
		
		HashMap<String, ArrayList<String>> map = new HashMap<String, ArrayList<String>>();
		
		ArrayList<String> info = new ArrayList<String>();
		
		info.add("notice"); //��������
		info.add("faq"); //�����ϴ�����
		info.add("qna"); //1:1����
		
		map.put("info", info);
		
		ArrayList<String> reservation = new ArrayList<String>();
		
		reservation.add("reser"); //����
		reservation.add("timetable"); //�󿵽ð�ǥ
		
		map.put("reservation", reservation);

		ArrayList<String> movie = new ArrayList<String>();
		
		movie.add("boxoffice"); //�ڽ����ǽ�
		movie.add("now"); //�������
		movie.add("comming"); //����������
		
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
	
	/*@RequestMapping("{menu}/{main}")
	public String view2(Model model, @PathVariable String menu, @PathVariable String main) {
//		System.out.println("menu::"+menu);
//		System.out.println("main::"+main);
		model.addAttribute("menu", menu);
		model.addAttribute("main", main);
		return "home";
	}*/
}
