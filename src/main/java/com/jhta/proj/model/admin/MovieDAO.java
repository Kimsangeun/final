package com.jhta.proj.model.admin;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

@Component
public class MovieDAO {
	//머지..?
	@Resource
	SqlSessionTemplate sessionTemplate;
	
	public Object list() {
		return sessionTemplate.selectList("adminMapper.movieList");
		
	}
	
	public Object getlist() {
		return sessionTemplate.selectList("adminMapper.movieList");
		
	}
}
