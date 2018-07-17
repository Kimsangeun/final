package com.jhta.proj;

import java.util.Map;

import javax.annotation.Resource;
import javax.naming.NoPermissionException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.proj.model.MemberDAO;

@Controller
public class AjaxController {
	
	@Resource
	MemberDAO dao;
	
	@RequestMapping(value="/ajax/modify", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> ajaxModify(@RequestParam Map<String, Object> map, HttpServletRequest servletRequest) 
			throws NoPermissionException{
		
		System.out.println(map);
		
		dao.ajaxModify(map);
		
		return map;
		
	}
	
	@RequestMapping(value="/ajax/withdrawal", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> ajaxWithdrawal(@RequestParam Map<String, Object> map, HttpServletRequest servletRequest) 
			throws NoPermissionException{
		
		System.out.println(map);
		
		dao.ajaxWithdrawal(map);
		
		return map;
		
	}
	
	@RequestMapping(value="/ajax/idChk", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> ajaxidChk(@RequestParam Map<String, Object> map, HttpServletRequest servletRequest) 
			throws NoPermissionException{
		
		System.out.println("ajax탔냐"+map);
		
		dao.ajaxidChk(map);
		
		return map;
		
	}
	
	
}
