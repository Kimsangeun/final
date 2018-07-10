package com.jhta.proj.model.admin;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

@Component
public class TimeTableDAO {

	@Resource
	SqlSessionTemplate sessionTemplate;
	
	public Object list(TimeTableVO vo) {
		return sessionTemplate.selectList("adminMapper.screenList",vo);
	}
	
	public Object timeChk(TimeTableVO vo) {
		return sessionTemplate.selectOne("adminMapper.timeChk", vo);
	}
	/*
	public Object timeOverlap(TimeTableVO vo) {
		return sessionTemplate.selectOne("adminMapper.timeOverlap", vo);
	}
	*/
	public Object insert(TimeTableVO vo) {
		return sessionTemplate.insert("adminMapper.insertCinema", vo);
	}
	

}
