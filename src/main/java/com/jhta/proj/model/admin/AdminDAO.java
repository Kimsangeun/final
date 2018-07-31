package com.jhta.proj.model.admin;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

import com.jhta.proj.model.BoardVO;

@Component
public class AdminDAO {
	//머지..?
	@Resource
	SqlSessionTemplate sessionTemplate;
	
	public Object memList(BoardVO vo) {
		return sessionTemplate.selectList("adminMapper.memList",vo);
		
	}
	
	public Object resvList(BoardVO vo) {
		return sessionTemplate.selectList("adminMapper.resvList",vo);
		
	}

	public Object yearList(Map<String, Object> map) {
		return sessionTemplate.selectList("adminMapper.movieSettleYear",map);
		
	}
	

	public Object monthList(Map<String, Object> map) {
		return sessionTemplate.selectList("adminMapper.movieSettleMonth",map);
		
	}
	
	public Object dayList(Map<String, Object> map) {
		return sessionTemplate.selectList("adminMapper.movieSettleDay",map);
	}
	
	public Object event(){
		return sessionTemplate.selectList("adminMapper.event");
	}
	
	public Object promo(){
		return sessionTemplate.selectList("adminMapper.promoList");
	}
	
	public Object promoUpdate(BoardVO vo){
		return sessionTemplate.update("adminMapper.promoUpdate",vo);
	}
	
	public Object dateSettle(SettleVO vo){
		return sessionTemplate.selectList("adminMapper.dateSettle",vo);
	}
	
	public Object totalCount(String board) {
		return sessionTemplate.selectOne("adminMapper.totalCount",board);
		
	}
}
