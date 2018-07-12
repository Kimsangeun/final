package com.jhta.proj;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.proj.model.MemberDAO;
import com.jhta.proj.model.MemberVO;

@Controller

public class JoinController {
	
	@Resource
	MemberDAO dao;
	
	@RequestMapping("joinForm")
	public String joinForm(Model model) {
		
		model.addAttribute("menu","member");
		model.addAttribute("main","joinForm");
		
		return "home";
	}
	//ㅁㄴㅇㄹ
	@RequestMapping("joinMember")
	public String joinMember(MemberVO vo, Model model) {
		
		System.out.println("가입한다");
		
		vo.setBirth(vo.makeBirth(vo.getYy(), vo.getMm(), vo.getDd()));
		
		dao.insert(vo);
		
		model.addAttribute("msg","가입완료");
		model.addAttribute("url","/proj");
		
		return "member/alert";
	}
}
