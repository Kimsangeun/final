package com.jhta.proj;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.naming.NoPermissionException;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.proj.model.MemberDAO;
import com.jhta.proj.model.admin.AdminDAO;
import com.jhta.proj.model.admin.MovieDAO;
import com.jhta.proj.util.Coolsms;
import com.jhta.proj.util.MakeNumber;

@Controller
public class AjaxController {
	
	@Resource
	MemberDAO dao;
	
	@Resource
	MovieDAO mdao;
	
	@Resource
	AdminDAO adao;
	
	@Resource
	MakeNumber cerf;
	
	@RequestMapping(value="/ajax/modify", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> ajaxModify(@RequestParam Map<String, Object> map, HttpServletRequest servletRequest) 
			throws NoPermissionException{
			
		System.out.println(map);
		
		if((map.get("newpw").equals(""))) {
			
			if(map.get("emailChange").equals("true")) {
				System.out.println("이메일은 바뀐다");
				dao.ajaxModify2(map);
				
			}else
			
			map.put("msg", "새로 수정된 내용이 없습니다.");
			
		}else {
			dao.ajaxModify(map);
		}
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
		
		String api_key = "NCSFTLCC5UICCUDI";
		String api_secret = "2ZTHIMVFZSGIFTVWFZ1YGVI6DCERZMSG";
		//Coolsms coolsms = new Coolsms(api_key, api_secret); // 메시지보내기 객체 생성 여기도 잠그기
		Integer key = cerf.makeNum(6); // 인증키 생성
		
		map.put("certNum", key);
		
		System.out.println(key);
		
		map.put("chk", "Y");
		
		/*
		 * Parameters 관련정보 : http://www.coolsms.co.kr/SDK_Java_API_Reference_ko#toc-0
		 */
		
		//여기부터 아래 잠궈놓을것
		/*HashMap<String, String> set = new HashMap<String, String>();
		set.put("to", (String)map.get("phone")); // 수신번호
		set.put("from", "01071303039"); // 발신번호
		set.put("text", "안녕하세요 시네마중앙입니다. 인증번호는 [" + key + "] 입니다."); // 문자내용
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
		*/
		return map;
		
	}
	
	@RequestMapping(value="/ajax/reviewChk", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> reviewChk(@RequestParam Map<String, Object> map, HttpServletRequest servletRequest) 
			throws NoPermissionException{
		//@RequestParam(value="userid") String id
		System.out.println("리뷰췍"+map);
		mdao.reviewChk(map);
		
		System.out.println("리뷰"+mdao.reviewChk(map));
		//dao.ajaxemailChk(map);
		
		return map;
		
	}
	
	@RequestMapping(value="/ajax/deadlineChk", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deadlineChk(@RequestParam Map<String, Object> map, HttpServletRequest servletRequest) 
			throws NoPermissionException{
		//@RequestParam(value="userid") String id
		System.out.println("데드췍"+map);
		
		System.out.println("리뷰"+mdao.movieDeadlineChk(map));
		//dao.ajaxemailChk(map);
		
		return map;
		
	}
	
	@RequestMapping(value="/ajax/sales", method = RequestMethod.POST)
	@ResponseBody
	public Object sales(@RequestParam Map<String, Object> map, HttpServletRequest servletRequest) 
			throws NoPermissionException{
		//@RequestParam(value="userid") String id
		Object res = null;
		System.out.println("sales : "+map);
		
		System.out.println("후후세일스"+map);
		System.out.println(map);
		
		switch ((String)map.get("type")) {
		case "day":
			res = adao.dayList(map);
			break;
		case "month":
			res = adao.monthList(map);
			break;
		case "year":
			res = adao.yearList(map);
			System.out.println("이어다이어"+res);
			break;

		}
		//dao.ajaxemailChk(map);
		
		return res;
		
	}
	
	/*@RequestMapping(value="/ajax/cancleChk", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> ajaxcancleChk(@RequestParam Map<String, Object> map, HttpServletRequest servletRequest) 
			throws Exception{
		
		System.out.println("ajax cancle탔냐");
		
		SimpleDateFormat aa = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		Date now = new Date();
		
		Date start = aa.parse((String)map.get("ss"));
		
		long gap = (start.getTime()-now.getTime())/1000/60;
		
		System.out.println(gap);
		if(gap<30) {
			System.out.println("N타냐");
			map.put("chk", "N");
		}else {
			map.put("chk", "Y");
		}
		
		return map;
		
	}*/
	
	
}
