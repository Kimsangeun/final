package com.jhta.proj.model;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

@Component
public class BoardDAO {

	@Resource
	SqlSessionTemplate sessionTemplate;

	public Object boardListSch(BoardVO vo) {
		System.out.println(vo);
		return sessionTemplate.selectList("boardMapper.boardListSch", vo);
	}
//	
//	public Object boardlist(BoardVO vo) {
//		System.out.println("보오오오오오오오오오오오오오오오드");
//		System.out.println(vo);
//		return sessionTemplate.selectList("boardMapper.boardList", vo);
//
//	}

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
	
	public Object totalCount(String kind, String title, String schCol) {
		Map<String, String> map = new HashMap<>();
		map.put("kind", kind);
		map.put("schCol", schCol);
		map.put("title", title);
		
		return sessionTemplate.selectOne("boardMapper.totalCount1", map);
	}

	public Object totalCount(String kind) {
		return sessionTemplate.selectOne("boardMapper.totalCount2", kind);
	}

	
	public Object someList(BoardVO bvo) {
		return sessionTemplate.selectList("boardMapper.someList", bvo);
	}
	
	public Object qnaList(BoardVO bvo) {
		return sessionTemplate.selectList("boardMapper.qnaList", bvo);
	}

	
	public Object nextSeq(BoardVO bvo) {
		return sessionTemplate.insert("boardMapper.nextseq", bvo);
	}
	public Object reply(BoardVO bvo) {
		return sessionTemplate.insert("boardMapper.replyInsert", bvo);
	}

	/*	public Object someList(BoardVO bvo, Integer start, Integer end, String kind) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("start", start);
		map.put("end", end);
		map.put("kind", kind);
		map.put("vo", bvo);
		System.out.println("다오맵"+map);
		return sessionTemplate.selectList("boardMapper.someList", map);
		
	}*/
}
