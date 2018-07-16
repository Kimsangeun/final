package com.jhta.proj.model;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

@Component
public class ReserDAO { //���� ����

	@Resource
	SqlSessionTemplate sessionTemplate;
	
	public Object list(ReserVO vo) {
		return sessionTemplate.selectList("reser.list", vo);
	}
	public Object insert(ReserVO vo) {
        return sessionTemplate.insert("reser.insert", vo);
    }

    public Object detail(ReserVO vo) {
        return sessionTemplate.selectOne("reser.detail", vo);
    }
}
