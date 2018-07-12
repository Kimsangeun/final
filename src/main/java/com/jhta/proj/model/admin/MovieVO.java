package com.jhta.proj.model.admin;

import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

@Alias("movieVo")//as
public class MovieVO {
	Integer mid,runtime,rating;
	String title,actor,director,nation,genre,plot,poster,steelcut,grade;
	MultipartFile poster1,steelcut1,steelcut2;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	Date release;
	public Integer getMid() {
		return mid;
	}
	public void setMid(Integer mid) {
		this.mid = mid;
	}
	public Integer getRuntime() {
		return runtime;
	}
	public void setRuntime(Integer runtime) {
		this.runtime = runtime;
	}
	public Integer getRating() {
		return rating;
	}
	public void setRating(Integer rating) {
		this.rating = rating;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getPlot() {
		return plot;
	}
	public void setPlot(String plot) {
		this.plot = plot;
	}
	public String getPoster() {
		return poster;
	}

	public String getSteelcut() {
		return steelcut;
	}

	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public MultipartFile getPoster1() {
		return poster1;
	}
	public void setPoster1(MultipartFile poster1) {
		this.poster1 = poster1;
		this.poster = poster1.getOriginalFilename();
	}
	public MultipartFile getSteelcut1() {
		return steelcut1;
	}
	public void setSteelcut1(MultipartFile steelcut1) {
		this.steelcut1 = steelcut1;
	}
	public MultipartFile getSteelcut2() {
		return steelcut2;
		
	}
	public void setSteelcut2(MultipartFile steelcut2) {
		this.steelcut2 = steelcut2;
		this.steelcut = steelcut1.getOriginalFilename()+"|"+steelcut2.getOriginalFilename();
	}
	public Date getRelease() {
		return release;
	}
	public void setRelease(Date release) {
		this.release = release;
	}
	@Override
	public String toString() {
		return "MovieVO [mid=" + mid + ", runtime=" + runtime + ", rating=" + rating + ", title=" + title + ", actor="
				+ actor + ", director=" + director + ", nation=" + nation + ", genre=" + genre + ", plot=" + plot
				+ ", poster1=" + poster1 + ", steelcut=" + steelcut + ", grade=" + grade + ", poster=" + poster
				+ ", steelcut1=" + steelcut1 + ", steelcut2=" + steelcut2 + ", release=" + release + "]";
	}
	
	
	
	
	
	
}
