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
	//ㅁㅁ
}
