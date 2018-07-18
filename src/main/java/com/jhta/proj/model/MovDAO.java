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
	
	public Object midList(ScreenInfoVO vo) {
		return sessionTemplate.selectList("mov.midList", vo);
	}
	public Object findMovie(MovVO vo) {
		return sessionTemplate.selectOne("mov.findMovie", vo);
	}
	
	public Object dateTitleList(ScreenInfoVO vo) {
		return sessionTemplate.selectList("mov.dateTitleList", vo);
	}
	
	public Object titlelist(MovVO vo) {
		return sessionTemplate.selectList("mov.titleList",vo);
	}
}
