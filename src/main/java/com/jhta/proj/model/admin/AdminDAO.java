package com.jhta.proj.model.admin;

import java.util.HashMap;

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

	public Object yearList(SettleVO vo) {
		return sessionTemplate.selectList("adminMapper.yearList",vo);
		
	}
	

	public Object monthList(SettleVO vo) {
		return sessionTemplate.selectList("adminMapper.monthList",vo);
		
	}
	
	public Object event(){
		return sessionTemplate.selectList("adminMapper.event");
	}
	
	public Object dateSettle(SettleVO vo){
		return sessionTemplate.selectList("adminMapper.dateSettle",vo);
	}
	
	public Object totalCount(String board) {
		return sessionTemplate.selectOne("adminMapper.totalCount",board);
		
	}
}
