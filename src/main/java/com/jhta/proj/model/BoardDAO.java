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
		System.out.println("dao_디테일");
		return sessionTemplate.selectOne("boardMapper.boardDetail", vo);

	}

	public Object insert(BoardVO vo) {
		System.out.println("dao_인서트");
		return sessionTemplate.insert("boardMapper.boardInsert", vo);
	}

	public Object modify(BoardVO vo) {
		System.out.println("dao_모디파이");
		return sessionTemplate.update("boardMapper.boardModify", vo);
	}

	public Object insertList(BoardVO vo) {
		return sessionTemplate.insert("boardMapper.boardInsertList", vo);
	}
	
	public Object cntplus(BoardVO vo) {
		return sessionTemplate.update("boardMapper.cntup", vo);
	}

	public Object delete(BoardVO vo) {
		return sessionTemplate.update("boardMapper.boardDelete", vo);
	}
	
	public Object findBoard(Integer bid) {
		return sessionTemplate.update("boardMapper.findBoard", bid);
	}
	
}
