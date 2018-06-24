package com.jhta.proj.logic;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.jhta.proj.model.MemberVO;

@Component
public class loginChk extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		
		//String url = request.getContextPath()+"/time";
		
		////로그인 되어야만 event 접근 가능
		
		
		MemberVO vo = (MemberVO)request.getSession().getAttribute("mem");
		
		if(vo==null) {/*
			request.setAttribute("msg", "로그인 후 이용 가능한 서비스 입니다.");
			request.setAttribute("url", "/proj/");
			response.sendRedirect("/proj/alert.jsp");*/
			response.sendRedirect("forbidden");
			
			return false;
		}
		
		/*if(url.equals(request.getRequestURI()) && request.getSession().getAttribute("mem")==null)
		{
			response.sendRedirect("qwer");
			
			return false;
		}
		
		MemberVO vo = (MemberVO)request.getSession().getAttribute("mem");
		if(!vo.getId().equals("admin")) {
			response.sendRedirect("qwer");
			
			return false;
		}*/
		
		return true;
	}
}
