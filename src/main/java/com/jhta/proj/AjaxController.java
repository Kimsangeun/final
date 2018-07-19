package com.jhta.proj;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.naming.NoPermissionException;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.proj.model.MemberDAO;
import com.jhta.proj.util.Coolsms;
import com.jhta.proj.util.MakeNumber;

@Controller
public class AjaxController {
	
	@Resource
	MemberDAO dao;
	
	@Resource
	MakeNumber cerf;
	
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
	
	@RequestMapping(value="/ajax/emailChk", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> ajaxemailChk(@RequestParam Map<String, Object> map, HttpServletRequest servletRequest) 
			throws NoPermissionException{
		
		System.out.println("ajax email탔냐"+map);
		
		dao.ajaxemailChk(map);
		
		return map;
		
	}
	
	
	@RequestMapping(value="/ajax/smsSend", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> smsSend(@RequestParam Map<String, Object> map, HttpServletRequest servletRequest) 
			throws NoPermissionException{
		
		System.out.println("send다"+map);
		
		String api_key = "NCSHUGYQCJ1RNAOB";
		String api_secret = "PUBVW1V4UIYGRTPONRKE3CQ9JDULA6ZN";
		Coolsms coolsms = new Coolsms(api_key, api_secret); // 메시지보내기 객체 생성
		Integer key = cerf.makeNum(6); // 인증키 생성
		
		map.put("certNum", key);
		
		System.out.println(key);
		
		//map.put("chk", "Y");
		
		/*
		 * Parameters 관련정보 : http://www.coolsms.co.kr/SDK_Java_API_Reference_ko#toc-0
		 */
		HashMap<String, String> set = new HashMap<String, String>();
		set.put("to", (String)map.get("phone")); // 수신번호
		set.put("from", "01071303039"); // 발신번호
		set.put("text", "안녕하세요 메가시네마입니다. 인증번호는 [" + key + "] 입니다."); // 문자내용
		set.put("type", "sms"); // 문자 타입

		JSONObject result = coolsms.send(set); // 보내기&전송결과받기
		
		if ((boolean) result.get("status") == true) {
			// 메시지 보내기 성공 및 전송결과 출력
			System.out.println("성공");
			
			System.out.println(result.get("result_code")); // 결과코드
			System.out.println(result.get("result_message")); // 결과 메시지
			System.out.println(result.get("success_count")); // 메시지아이디
			
			map.put("chk", "Y");
			
		} else {
			// 메시지 보내기 실패
			System.out.println("실패");
			System.out.println(result.get("code")); // REST API 에러코드
			System.out.println(result.get("message")); // 에러메시지
			
			map.put("chk", "N");
		}
		
		return map;
		
	}
	
	
}
