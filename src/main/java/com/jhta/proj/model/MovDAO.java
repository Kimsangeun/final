package com.jhta.proj.model;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

@Component
public class MovDAO {

	@Resource
	SqlSessionTemplate sessionTemplate;
	
	public Object list(MovVO vo) {
		return sessionTemplate.selectList("mov.list", vo);
	}
}
