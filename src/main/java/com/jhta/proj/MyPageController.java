package com.jhta.proj;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.proj.model.MemberDAO;
import com.jhta.proj.model.MemberVO;
import com.jhta.proj.model.ReserVO;

@Controller
@RequestMapping("mypage/{service}")
public class MyPageController {
	
	@Resource
	MemberDAO dao;
	
	@RequestMapping()
	public String myPage(Model model,@PathVariable String service) {
		
		model.addAttribute("main", service);
		
		if(service.equals("cancle")) {
			model.addAttribute("main","reser");
		}
		
		model.addAttribute("menu","mypage");
		
		return "home";
	}
	
	@ModelAttribute("data")
	Object data(@PathVariable String service, Model model, MemberVO vo, HttpSession session, ReserVO rvo) {
		
		Object res = null;
		MemberVO v1=(MemberVO)session.getAttribute("mem");
		//vo.setId(session.getAttribute("mem"));
		System.out.println("vo"+v1.getId());
		switch(service) {
		case "reser":
			
			res = dao.reserList(v1);
			break;
		case "cancle":
			
			res = dao.reserCancle(rvo,v1);
			break;
		/*case "qna":
			res = dao.qnaList(vo);
			break;*/
		case "memInfo":
			res = dao.info(v1);
			break;
		}
		
		return res;
		
	}
}
