package com.jhta.proj.model;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

@Component
public class ScreenInfoDAO {

	@Resource
	SqlSessionTemplate sessionTemplate;
	
	//for printing datelist in reser.jsp 
	public Object datelist(ScreenInfoVO vo) {
		return sessionTemplate.selectList("mov.dateList",vo);
	}
	
	public ScreenInfoVO findSInfo(ScreenInfoVO vo) {
		return sessionTemplate.selectOne("mov.findInfo",vo);
	}
	
}
