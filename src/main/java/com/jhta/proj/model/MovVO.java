package com.jhta.proj.model;

import java.util.Date;

import org.apache.ibatis.type.Alias;


@Alias("movVo")
public class MovVO {
	int mId, runtime;
	double rating;
	String title, nation, genre, poster, director, plot, actor;
	Date release;
	
	
	public int getmId() {
		return mId;
	}
	public void setmId(int mId) {
		this.mId = mId;
	}
	public int getRuntime() {
		return runtime;
	}
	public void setRuntime(int runtime) {
		this.runtime = runtime;
	}
	public double getRating() {
		return rating;
	}
	public void setRating(double rating) {
		this.rating = rating;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getPlot() {
		return plot;
	}
	public void setPlot(String plot) {
		this.plot = plot;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	public Date getRelease() {
		return release;
	}
	public void setRelease(Date release) {
		this.release = release;
	}

	@Override
	public String toString() {
		return "MovieDTO [mId=" + mId + ", runtime=" + runtime + ", rating=" + rating + ", title=" + title + ", nation="
				+ nation + ", genre=" + genre + ", poster=" + poster+ ", director=" + director + ", plot=" + plot
				+ ", actor=" + actor + ", release=" + release + "]";
	}
	//asdasd
}