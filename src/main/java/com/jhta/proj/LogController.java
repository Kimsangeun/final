package com.jhta.proj;

import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.cglib.transform.impl.AddDelegateTransformer;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.proj.logic.PwSearchValidate;
import com.jhta.proj.model.MemberDAO;
import com.jhta.proj.model.MemberVO;
import com.jhta.proj.util.MailHandler;
import com.jhta.proj.util.MakeNumber;

@Controller
public class LogController {
	
	@Resource
	MemberDAO dao;
	
	@Resource
	MakeNumber tempPw;
	
	@Resource
	MailHandler sendMail;
	
	@RequestMapping("loginReg")
	public String loginReg(MemberVO vo, HttpSession session,Model model) {
		
		System.out.println("컨트롤러"+vo);
		MemberVO res = dao.isChk(vo);
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
	
	@RequestMapping("search")
	public String search(HttpSession session,Model model) {
		
		model.addAttribute("menu","member");
		model.addAttribute("main","search");
		
		return "home";
	}
	
	@RequestMapping("idSearch")
	public String idSearch(MemberVO vo, Model model, HttpServletRequest request) {
		
		vo.setName(request.getParameter("id_name"));
		vo.setPhone(request.getParameter("id_phone"));	
		
		String msg = "일치하는 id정보가 없습니다."; 
		
		if(dao.idSearch(vo)!=null) {
			msg = "회원님의 아이디는 "+dao.idSearch(vo)+"입니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url","search");
		
		return "member/alert";
	}
	
	@RequestMapping("pwSearch")
	public String pwSearch(MemberVO vo, Model model, HttpServletRequest request, BindingResult errors) throws Exception {
		
		String temp = tempPw.makeNum(9)+"";
		
		vo.setId(request.getParameter("pw_id"));
		vo.setName(request.getParameter("pw_name"));
		vo.setPhone(request.getParameter("pw_phone"));
		vo.setPw(temp);
		
		String msg = "";
		
		new PwSearchValidate().validate(vo, errors);
		
		if(errors.hasErrors()) {
			
			msg = errors.getFieldError().getDefaultMessage();
			
			model.addAttribute("msg", msg);
			model.addAttribute("url","search");
			
			return "member/alert";
		
		}
		
		MemberVO info = dao.pwSearch(vo);
		
		if(info!=null) {
			
			if(info.getOut()==0) {
				
			msg = "회원님의 이메일("+info.getEmail()+")로 임시비밀번호를 전송하였습니다.";
			
			sendMail.setSubject("[시네마중앙 임시비밀번호]");
			sendMail.setText("임시비밀번호는"+temp+"입니다.");
					
			sendMail.setFrom("admin@megacinema.com", "시네마중앙");
			sendMail.setTo(info.getEmail());
			sendMail.send();
			
			}else {
				msg = "탈퇴하신 회원님은 PW찾기를 사용하실 수 없습니다.";
			}
		}
		
		System.out.println(msg);
		
		model.addAttribute("msg", msg);
		model.addAttribute("url","search");
		
		return "member/alert";
	}
	
	
	
}
