package com.jhta.proj.model.admin;

import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

@Alias("reviewVo")//as
public class ReviewVO {
	Float tmpScore;//.5점들 들어가게수정
	Integer mid,score;
	String id,review;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	Date reg_date;
	
	
	public Float getTmpScore() {
		return tmpScore;
	}
	public void setTmpScore(Float tmpScore) {
		this.tmpScore = tmpScore;
		this.score = (int)(tmpScore*2);
	}
	public Integer getMid() {
		return mid;
	}
	public void setMid(Integer mid) {
		this.mid = mid;
	}
	public Integer getScore() {
		return score;
	}
	public void setScore(Integer score) {
		this.score = score;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	
	@Override
	public String toString() {
		return "ReviewVO [mid=" + mid + ", score=" + score + ", id=" + id + ", review=" + review + ", reg_date="
				+ reg_date + "]";
	}
	
	
	
}
