package com.jhta.proj.model;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

@Component
public class ReserDAO { //���� ����

	@Resource
	SqlSessionTemplate sessionTemplate;
	
}
