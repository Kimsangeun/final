package com.jhta.proj;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jhta.proj.model.admin.*;


/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("info/{service}")
public class CenterController {
	
	//private static final Logger logger = LoggerFactory.getLogger(MyBatisController.class);
	
	@Resource
	TimeTableDAO timeDao;
	
	@Resource
	MovieDAO movieDao;
	
	@Resource
	ScreenDAO screenDao;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	/*@ModelAttribute("menu")
	String menu() {
		return "admin";
	}
	
	@ModelAttribute("main")
	String main(@PathVariable String service) {
		String res = service;
		
		switch (service) {		
		
			case "insert":
				res = "alert";
				break;
		
		}
		
		return res;
	}
	*/
	
	@RequestMapping()
	String selectList(@PathVariable String service, TimeTableVO vo, Model model) {
		
		
		String res = "info/"+service;
//		System.out.println(vo);
		System.out.println("안녕하세요");
		model.addAttribute("main", service);
		model.addAttribute("menu", "info");
		System.out.println("포비든킹덤");

		return "home";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	String sss(@PathVariable String service, TimeTableVO vo,BindingResult errors) {
		

		System.out.println("포스트");
		String res = "home";


		if(service.equals("insert")) {
			res = "admin/alert";

		}
		

		return res;
	}
	
	
	
	
	
}
