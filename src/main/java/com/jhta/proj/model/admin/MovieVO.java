package com.jhta.proj.model.admin;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

@Alias("movieVo")//as
public class MovieVO {
	Integer mid,runtime,rating;
	String title,actor,director,nation,genre,plot,poster,steelcut,grade
	,realpath,bookingRate;//예매율
	
	MultipartFile poster1;
	ArrayList<MultipartFile> steelcuts;
	
	public ArrayList<MultipartFile> getSteelcuts() {
		return steelcuts;
	}
	public void setSteelcuts(ArrayList<MultipartFile> steelcuts) {
		this.steelcuts = steelcuts;
	}

	@DateTimeFormat(pattern="yyyy-MM-dd")
	Date release;
	public Integer getMid() {
		return mid;
	}
	public String getBookingRate() {
		return bookingRate;
	}
	public void setBookingRate(String bookingRate) {
		this.bookingRate = bookingRate;
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
		
		/*plot.replaceAll("\n", "<br>");*/
		return plot.replaceAll("\n", "<br>");
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
	}
	public Date getRelease() {
		return release;
	}
	public void setRelease(Date release) {
		this.release = release;
	}
	
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public void setSteelcut(String steelcut) {
		this.steelcut = steelcut;
	}
	public void setPosterName(String poster) {
		this.poster = poster;
	}

	public String getRealpath() {
		return realpath;
	}
	public void setRealpath(String realpath) {
		this.realpath = realpath;
	}
	
	//스틸컷 이름추가(리네임된 이름으로)
	public void setSteelcutsName(ArrayList<String> bb) {
		this.steelcut="";
		for(String name : bb) {
			this.steelcut += "|"+name;
		}
		this.steelcut = this.steelcut.substring(1);
		System.out.println(steelcut);
	}
	
	@Override
	public String toString() {
		return "MovieVO [mid=" + mid + ", runtime=" + runtime + ", rating=" + rating + ", title=" + title + ", actor="
				+ actor + ", director=" + director + ", nation=" + nation + ", genre=" + genre + ", plot=" + plot
				+ ", poster=" + poster + ", steelcut=" + steelcut + ", grade=" + grade + ", poster1=" + poster1
				+ ", release=" + release +", steelcuts"
				+ steelcuts
				+ "]";
	}
	
	
	
	
	
	
	
	
	
	
}
