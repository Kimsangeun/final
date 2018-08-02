package com.jhta.proj.model.admin;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

import com.jhta.proj.model.BoardVO;

@Component
public class MovieDAO {
	//머지..?
	@Resource
	SqlSessionTemplate sessionTemplate;
	
	public Object list() {
		return sessionTemplate.selectList("adminMapper.movieAll");
		
	}
	
	public Object getlist(BoardVO vo) {
		return sessionTemplate.selectList("adminMapper.movieList",vo);
		
	}
	
	public Object movieNoDead() {
		return sessionTemplate.selectList("adminMapper.movieNoDead");
		
	}
	
	public Object selectDayMovieList(TimeTableVO vo) {
		return sessionTemplate.selectList("adminMapper.selectDayMovieList",vo);
		
	}
	
	public Object insertMovie(MovieVO vo) {

		return sessionTemplate.insert("adminMapper.movieInsert", vo);
	}
	
	public Object deleteMovie(MovieVO vo) {

		return sessionTemplate.delete("adminMapper.movieDelete", vo);
	}
	
	public Object detailMovie(MovieVO vo) {

		return sessionTemplate.selectOne("adminMapper.movieDetail", vo);
	}
	
	public Object modifyMovie(MovieVO vo) {
		return sessionTemplate.update("adminMapper.movieModify", vo);
	}
	
	public Object nowMovie() {

		return sessionTemplate.selectList("adminMapper.nowShowing");
	}
	
	public Object comingMovie() {

		return sessionTemplate.selectList("adminMapper.comingSoon");
	}
	
	public Object boxoffice() {

		return sessionTemplate.selectList("adminMapper.boxoffice");
	}
	
	public Object movieDeadline(MovieVO vo) {	//영화마감
		return sessionTemplate.update("adminMapper.movieDeadline", vo);
	}
	
	public Object movieDeadlineChk(Map<String, Object> map) {

		
		if((int)sessionTemplate.selectOne("adminMapper.movieDeadlineChk",map)>=1) {
			map.put("chk", 1);
		}
		
		return map;
	}
	
	public Object reviewChk(Map<String, Object> map) {

		
		if((int)sessionTemplate.selectOne("adminMapper.reviewChk",map)>=1) {
			map.put("chk", 1);
		}
		
		return map;
	}
	
	public Object review(MovieVO vo) {

		return sessionTemplate.selectList("adminMapper.review",vo);
	}
	
	public Object realShow(MovieVO vo) {

		return sessionTemplate.selectList("adminMapper.realShow",vo);
	}
	
	public Object reviewInsert(ReviewVO vo) {

		return sessionTemplate.insert("adminMapper.reviewInsert",vo);
	}
	
	public Object deleteChk(ReviewVO vo) {

		return sessionTemplate.selectOne("adminMapper.deleteChk",vo);
	}
	
	public Object reviewDelete(ReviewVO vo) {

		return sessionTemplate.delete("adminMapper.reviewDelete", vo);
	}
	
	public Object scoreUpdate(ReviewVO vo) {

		return sessionTemplate.update("adminMapper.scoreUpdate", vo);
	}
}
