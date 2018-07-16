package com.jhta.proj.model.admin;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

@Component
public class AdminDAO {
	//머지..?
	@Resource
	SqlSessionTemplate sessionTemplate;
	
	public Object memList() {
		return sessionTemplate.selectList("adminMapper.memList");
		
	}
	
	public Object resvList() {
		return sessionTemplate.selectList("adminMapper.resvList");
		
	}

	public Object yearList(SettleVO vo) {
		return sessionTemplate.selectList("adminMapper.yearList",vo);
		
	}
	

	public Object monthList(SettleVO vo) {
		return sessionTemplate.selectList("adminMapper.monthList",vo);
		
	}
	
	
}
