package com.jhta.proj.model.admin;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("movieVo")
public class MovieVO {
	Integer mid;
	String title;
	Date release;
	
	public Integer getMid() {
		return mid;
	}
	public void setMid(Integer mid) {
		this.mid = mid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getRelease() {
		return release;
	}
	public void setRelease(Date release) {
		this.release = release;
	}
	@Override
	public String toString() {
		return "MovieVO [mid=" + mid + ", title=" + title + ", release=" + release + "]";
	}
	
	
	
	
}
