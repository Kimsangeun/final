package com.jhta.proj.model;

import java.util.Date;

import org.apache.ibatis.type.Alias;


@Alias("movVo")
public class MovVO {
	int mID, runtime;
	double rating;
	String title, nation, genre, image, director, plot, actor;
	Date release;
	
	
	public int getmID() {
		return mID;
	}
	
	//@required
	public void setmID(int mID) {
		this.mID = mID;
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
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
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
		return "MovieDTO [mID=" + mID + ", runtime=" + runtime + ", rating=" + rating + ", title=" + title + ", nation="
				+ nation + ", genre=" + genre + ", image=" + image + ", director=" + director + ", plot=" + plot
				+ ", actor=" + actor + ", release=" + release + "]";
	}
	//asdasd
}