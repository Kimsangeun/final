package com.jhta.proj.model;

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
	
}
