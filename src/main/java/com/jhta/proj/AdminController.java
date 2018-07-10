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

import com.jhta.proj.logic.timeChk;
import com.jhta.proj.model.admin.MovieDAO;
import com.jhta.proj.model.admin.ScreenDAO;
import com.jhta.proj.model.admin.TimeTableDAO;
import com.jhta.proj.model.admin.TimeTableVO;



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
	@RequestMapping()
	String selectList(@PathVariable String service, TimeTableVO vo) {
		
		
		String res = "admin/"+service;
		System.out.println(vo);


		return res;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	String sss(@PathVariable String service, TimeTableVO vo,BindingResult errors) {
		
		//System.out.println("보이루" + vo);
		String res = "admin/"+service;
		System.out.println(vo);

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
		Object res = null;
		HashMap<String, Object> mapp = new HashMap<>();
		//System.out.println("날짜르"+vo.getShowtime());
		switch (service) {
		
		case "time":
			mapp.put("time", timeDao.list(vo));
			mapp.put("movie", movieDao.list());
			mapp.put("screen", screenDao.list());

			res = mapp;

			//한글코오딩
			break;
		case "list":
			
			break;
		
		case "insert":

			model.addAttribute("msg", "동일한 시간에 다른관에서 상영예정입니다.");
			//TimeTableVO chkVo = (TimeTableVO)timeDao.timeChk(vo);
			
			res = timeDao.timeChk(vo);
			System.out.println("res="+res);
			
			/*res = timeDao.timeOverlap(vo);
			System.out.println("res2="+res);*/
			
			if(res==null) {
				timeDao.insert(vo);
				model.addAttribute("msg", 
						vo.getShowtime()+"//"+vo.getScNum()+"관 추가완료");
			}
			model.addAttribute("url", "time?mstart="+vo.getShowdate());
			break;
		
		}
		return res;
	}
	
	
	
	
}
