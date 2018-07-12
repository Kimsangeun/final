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
@RequestMapping("admin/{service}")
public class AdminController {
	
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
		
		
		String res = "admin/"+service;
//		System.out.println(vo);
		System.out.println("안녕하세요");
		model.addAttribute("main", service);
		model.addAttribute("menu", "admin");
		System.out.println("포비든킹덤");

		return "home";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	String sss(@PathVariable String service, TimeTableVO vo,BindingResult errors) {
		
		//System.out.println("보이루" + vo);
		System.out.println("포스트");
		String res = "home";
//		System.out.println(vo);

		if(service.equals("insert")) {
			res = "admin/alert";
			System.out.println("zzzz");
			/*new timeChk().validate(vo, errors);
			if(errors.hasErrors())
				return res;*/
		
		}
		

		return res;
	}
	
	@ModelAttribute("data")
	Object res(@PathVariable String service,TimeTableVO vo,Model model) {
		System.out.println("데이타만");
		Object res = null;
		HashMap<String, Object> mapp = new HashMap<>();
		//System.out.println("날짜르"+vo.getShowtime());
		switch (service) {
		
		case "time":
			mapp.put("time", timeDao.list(vo));
			mapp.put("movie", movieDao.selectDayMovieList(vo));
			mapp.put("screen", screenDao.list());

			res = mapp;

			//한글코오딩
			break;
		case "list":
			
			break;
		
		case "insert":

			model.addAttribute("msg", "동일한 시간에 다른관에서 상영예정입니다.");
			//TimeTableVO chkVo = (TimeTableVO)timeDao.timeChk(vo);
			
			Object chk1 = timeDao.timeChk(vo);
			System.out.println("chk1="+chk1);
			
			Object chk2 = timeDao.screenChk(vo);
			System.out.println("chk2="+chk2);
			
			Object chk3 = timeDao.timeOverlap(vo);
			System.out.println("chk3="+chk3);
			
			Object chk4 = timeDao.timeOverlapEnd(vo);
			System.out.println("chk4="+chk4);
			
			if(chk1==null && chk2==null && chk3==null && chk4==null) {
				System.out.println("들어오느냐");
				timeDao.insert(vo);
				model.addAttribute("msg", 
						vo.getShowtime()+"//"+vo.getScNum()+"관 추가완료");
			}
			/*if(res==null) {
				System.out.println("들어오느냐");
				timeDao.insert(vo);
				model.addAttribute("msg", 
						vo.getShowtime()+"//"+vo.getScNum()+"관 추가완료");
			}*/
			model.addAttribute("url", "time?mstart="+vo.getShowdate());
			break;
		
		}
		return res;
	}
	
	
	
	
}
