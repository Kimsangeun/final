package com.jhta.proj.model;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

@Component
public class MemberDAO {
	
	@Resource
	SqlSessionTemplate sessionTemplate;
	
	public Object isChk(MemberVO vo){
		System.out.println("DAO"+vo);
		return sessionTemplate.selectOne("mem.isChk", vo);
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
		
		sessionTemplate.selectList("mem.cancle",vo);
		
		return sessionTemplate.selectList("mem.reser", v1);

	}
	
	/*public Object qnaList(MemberVO vo) {
		
		System.out.println("qna가져옴");
		
		return sessionTemplate.selectList("mem.qna", vo);
			
	}*/

	public Object info(MemberVO vo) {
	
	System.out.println("info가져옴");
	
	return sessionTemplate.selectOne("mem.info", vo);
		
	}

	public Map<String, Object> ajaxModify(Map<String, Object> map) {
		
		if(sessionTemplate.selectOne("mem.pwChk", map)!=null) {
			sessionTemplate.update("mem.modify",map);
			
			map.put("msg", "회원정보수정완료");
		}else {
			System.out.println("오냐");
			
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
			System.out.println("오냐");
			
			map.put("msg", "비밀번호가 맞지않습니다.");
		}
		
		return map;
		
	}
	
	
}
