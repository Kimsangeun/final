package com.jhta.proj;

import java.util.Date;
import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jhta.proj.model.BoardDAO;
import com.jhta.proj.model.BoardVO;
import com.jhta.proj.model.ReserVO;
import com.jhta.proj.model.admin.*;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("info/{service}")
public class CenterController {

	// private static final Logger logger =
	// LoggerFactory.getLogger(MyBatisController.class);

	@Resource
	TimeTableDAO timeDao;

	@Resource
	MovieDAO movieDao;

	@Resource
	ScreenDAO screenDao;

	@Resource
	BoardDAO boardDao;

	/**
	 * Simply selects the home view to render by returning its name.
	 */

	/*
	 * @ModelAttribute("menu") String menu() { return "admin"; }
	 * 
	 * @ModelAttribute("main") String main(@PathVariable String service) { String
	 * res = service;
	 * 
	 * switch (service) {
	 * 
	 * case "insert": res = "alert"; break; } return res; }
	 */

	@RequestMapping()
	String selectList(@PathVariable String service, BoardVO vo, Model model) {

		String res = "home";
		// System.out.println(vo);
		System.out.println("안녕하세요");
		model.addAttribute("main", service);
		model.addAttribute("menu", "info");
		System.out.println("포비든킹덤");
		// if(service.equals("deleteMovie")) {
		// res = "admin/alert";
		// }

		return res;
	}

	@ModelAttribute("list")
	Object list(@PathVariable String service, BoardVO bvo, Model model) {

		Object res = null;
		// System.out.println(vo);
		switch (service) {
		case "notice":
			System.out.println("서비스 타긴 하지");
			System.out.println("공지사항 ㄱㄱ");

			bvo.setKind("notice");
			System.out.println(bvo);

			res = boardDao.boardlist(bvo);
			break;

		case "faq":
			System.out.println("faq ㄱㄱ");

			bvo.setKind("faq");
			System.out.println(bvo);

			res = boardDao.boardlist(bvo);

			break;

		case "qna":
			System.out.println("qna ㄱㄱ");

			bvo.setKind("qna");
			System.out.println(bvo);

			res = boardDao.boardlist(bvo);

			break;
		}
		return res;
	}

	@RequestMapping(method = RequestMethod.POST)
	String sss(@PathVariable String service, TimeTableVO vo, BindingResult errors) {

		System.out.println("포스트");
		String res = "home";

		if (service.equals("insert")) {
			res = "admin/alert";
		}
		return res;
	}
}
