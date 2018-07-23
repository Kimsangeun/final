package com.jhta.proj.model;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

import com.jhta.proj.util.MakeNumber;

@Component
public class MemberDAO {
	
	@Resource
	SqlSessionTemplate sessionTemplate;
	
	public MemberVO isChk(MemberVO vo){
		System.out.println("DAO"+vo);
		return sessionTemplate.selectOne("mem.isChk", vo);
	}
	
	public String idSearch(MemberVO vo) {
		System.out.println("id찾자");
		return sessionTemplate.selectOne("mem.idSearch",vo);
	}
	
	public MemberVO pwSearch(MemberVO vo) {
		
		MemberVO info = sessionTemplate.selectOne("mem.pwSearch",vo);
		
		System.out.println(info.getOut());
		
		if(info!=null) {
			
			if(info.getOut()==0) {
			
				sessionTemplate.update("mem.pwChange",vo);
				System.out.println("임시패스워스로 디비바꿈");
			}
		}
	
		return info;
	}
	
	public void insert(MemberVO vo) {
		
		sessionTemplate.insert("mem.join",vo);
		
		System.out.println("insert하냐");
	}
	
	public Object reserList(MemberVO vo) {
		
		System.out.println("reser가져옴");
		
		return sessionTemplate.selectList("mem.reser", vo);
			
	}
	
	public Object reserCancle(ReserVO vo, MemberVO v1) {
		
		System.out.println("예약지웠다");
		
		sessionTemplate.delete("mem.cancle",vo);
		
		return sessionTemplate.selectList("mem.reser", v1);

	}
	
	public Object info(MemberVO vo) {
	
	System.out.println("info가져옴");
	
	return sessionTemplate.selectOne("mem.info", vo);
		
	}

	public Map<String, Object> ajaxModify(Map<String, Object> map) {
		
		if(sessionTemplate.selectOne("mem.pwChk", map)!=null) {
			
			sessionTemplate.update("mem.modify",map);
			
			map.put("msg", "회원정보수정완료");
		}else {
			
			map.put("msg", "비밀번호가 맞지않습니다.");
		}
		
		return map;
		
	}
	
	public Map<String, Object> ajaxModify2(Map<String, Object> map) {
		
		if(sessionTemplate.selectOne("mem.pwChk", map)!=null) {
				
			sessionTemplate.update("mem.modify2",map);
			
			map.put("msg", "회원정보수정완료");
		}else {
			
			map.put("msg", "비밀번호가 맞지않습니다.");
		}
		
		return map;
		
	}
	
	public Map<String, Object> ajaxWithdrawal(Map<String, Object> map) {
		
		if(sessionTemplate.selectOne("mem.pwChk", map)!=null) {
			sessionTemplate.update("mem.withdrawal",map);
			
			System.out.println("탈퇴완료");
			
			map.put("msg", "회원탈퇴완료");
		}else {
			
			map.put("msg", "비밀번호가 맞지않습니다.");
		}
		
		return map;
		
	}
	
	public Map<String, Object> ajaxidChk(Map<String, Object> map) {
		
		System.out.println("id체크오냐");
		
		if(sessionTemplate.selectOne("mem.idChk", map)==null) {
			map.put("chk", "Y");
		}
		
		return map;
		
	}
	
	public Map<String,Object> ajaxemailChk(Map<String,Object> map){
		
		System.out.println("DAOemail");
		
		if(sessionTemplate.selectOne("mem.emailChk",map)==null) {
			map.put("chk", "Y");
		}	
		
		return map;
	}
	
	
	
	
}
