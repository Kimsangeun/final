package com.jhta.proj.model;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

@Component
public class BoardDAO {

	@Resource
	SqlSessionTemplate sessionTemplate;

	public Object boardlist(BoardVO vo) {
		System.out.println("보오오오오오오오오오오오오오오오드");
		System.out.println(vo);
		return sessionTemplate.selectList("boardMapper.boardList", vo);

	}

	public Object detail(BoardVO vo) {
		return sessionTemplate.selectOne("boardMapper.boardDetail", vo);

	}

	public Object insert(BoardVO vo) {
		return sessionTemplate.insert("boardMapper.boardInsert", vo);

	}

	public Object insertList(BoardVO vo) {
		return sessionTemplate.insert("boardMapper.boardInsertList", vo);
	}

}
