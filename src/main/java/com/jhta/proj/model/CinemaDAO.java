package com.jhta.proj.model;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

@Component
public class CinemaDAO { //������
	
	@Resource
	SqlSessionTemplate sessionTemplate;
	
	public Object list(CinemaVO vo) {
		return sessionTemplate.selectList("cin.list", vo);
	}
}
