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
	
}
