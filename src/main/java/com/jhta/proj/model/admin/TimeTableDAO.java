package com.jhta.proj.model.admin;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

@Component
public class TimeTableDAO {

	@Resource
	SqlSessionTemplate sessionTemplate;
	
	public Object list(TimeTableVO vo) {
		return sessionTemplate.selectList("adminMapper.screenList");
	}
	
	public Object insert(TimeTableVO vo) {
		return sessionTemplate.insert("adminMapper.insertCinema", vo);
	}
}
