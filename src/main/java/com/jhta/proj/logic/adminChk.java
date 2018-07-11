package com.jhta.proj.logic;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.jhta.proj.model.MemberVO;

@Component
public class adminChk extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		
		//String url = request.getContextPath()+"/time";
		
		////로그인 되어야만 event 접근 가능
		
		Object res = request.getSession().getAttribute("mem");
		//MemberVO vo = (MemberVO)request.getSession().getAttribute("mem");
		
		if(res!=null) {
			MemberVO vo = (MemberVO)res;
			if(!vo.getId().equals("admin")) {
				System.out.println("관리자가아님");
				response.sendRedirect("forbidden");
				return false;
			}
		}else {
			System.out.println("로그인하세요");
			response.sendRedirect("forbidden");
			return false;
		}
		return true;
		
		
		/*MemberVO vo = (MemberVO)request.getSession().getAttribute("mem");
		
		if(url.equals(request.getRequestURI()) && request.getSession().getAttribute("mem")==null)
		{
			
			
			response.sendRedirect("qwer");
			
			return false;
		}
		
		MemberVO vo = (MemberVO)request.getSession().getAttribute("mem");
		if(!vo.getId().equals("admin")) {
			response.sendRedirect("qwer");
			
			return false;
		}
		
		return true;*/
	}
}
