package com.jhta.proj.model;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

@Component
public class ReserDAO { //���� ����

	@Resource
	SqlSessionTemplate sessionTemplate;
	
	public Object list() {
		return sessionTemplate.selectList("reser.list");
	}
	public Object insert(ReserVO vo) {
        return sessionTemplate.insert("reser.insert", vo);
    }

    public Object detail(ReserVO vo) {
        return sessionTemplate.selectOne("reser.detail", vo);
    }
    public Object seatlist(ReserVO vo) {
        return sessionTemplate.selectList("reser.schseatnum", vo);
    }
}
