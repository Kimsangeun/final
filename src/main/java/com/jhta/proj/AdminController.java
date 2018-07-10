package com.jhta.proj;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	String sss(@PathVariable String service, TimeTableVO vo) {
		
		System.out.println("보이루" + vo);
		String res = "admin/"+service;
		System.out.println(vo);

		if(service.equals("time")) {
			System.out.println("zzzz");
			timeDao.insert(vo);
		}
		

		return res;
	}
	
	@ModelAttribute("data")
	Object res(@PathVariable String service,TimeTableVO vo) {
		Object res = null;
		HashMap<String, Object> mapp = new HashMap<>();
		System.out.println("날짜르"+vo.getMstart());
		switch (service) {
		case "time":
			mapp.put("time", timeDao.list(vo));
			mapp.put("movie", movieDao.list());
			mapp.put("screen", screenDao.list());
			System.out.println(timeDao.list(vo));
			res = mapp;
			System.out.println("데이타~"+res);
			//한글코오딩
			break;
		case "list":
			
			break;
		
		}
		return res;
	}
	
	
	
	
}
