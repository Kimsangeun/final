package com.jhta.proj.logic;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class EventChk extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		
		String url = request.getContextPath()+"/event";
		
		////로그인 되어야만 event 접근 가능
		
		
		
		
		if(url.equals(request.getRequestURI()) && request.getSession().getAttribute("mem")==null )
		{
			response.sendRedirect("qwer");
			
			return false;
		}
		
		return true;
	}
}
