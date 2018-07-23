package com.jhta.proj.model.admin;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

@Component
public class MovieDAO {
	//머지..?
	@Resource
	SqlSessionTemplate sessionTemplate;
	
	public Object list() {
		return sessionTemplate.selectList("adminMapper.movieList");
		
	}
	
	public Object getlist() {
		return sessionTemplate.selectList("adminMapper.movieList");
		
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
	
	public Object nowMovie() {

		return sessionTemplate.selectList("adminMapper.nowShowing");
	}
	
	public Object comingMovie() {

		return sessionTemplate.selectList("adminMapper.comingSoon");
	}
	
	public Object boxoffice() {

		return sessionTemplate.selectList("adminMapper.boxoffice");
	}
	
	public Object review(MovieVO vo) {

		return sessionTemplate.selectList("adminMapper.review",vo);
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
