package com.jhta.proj;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import com.jhta.proj.model.MemberDAO;
import com.jhta.proj.model.MemberVO;

@Controller
public class LogController {
	
	@Resource
	MemberDAO dao;
	
	@RequestMapping("loginReg")
	public String loginReg(MemberVO vo, HttpSession session,Model model) {
		
		System.out.println("컨트롤러"+vo);
		MemberVO res=(MemberVO)dao.isChk(vo);
		String msg = "로그인 실패";
		String url = "/proj";
		if(res!=null) {
			session.setAttribute("mem", res);
			msg = res.getId()+"("+ res.getName()+")님 로그인 성공";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "member/alert";
	}
	
	@RequestMapping("logOut")
	public String logOut(HttpSession session,Model model) {
		
		String msg = ((MemberVO)session.getAttribute("mem")).getName()+"님 로그아웃";
		
		session.invalidate();
		
		model.addAttribute("msg", msg);
		model.addAttribute("url","/proj");
		return "member/alert";
	}
	//ㄴㅇㄴㅇㄴ
}
