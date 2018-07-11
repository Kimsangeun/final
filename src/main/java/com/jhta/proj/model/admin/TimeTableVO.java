package com.jhta.proj.model.admin;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

@Alias("timeVo")//dfdf
public class TimeTableVO {
	Integer sID,scNum,mID;
	String showdate,showtime,timeset,title;
	
	SimpleDateFormat dateSch = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat timeSch = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	//SimpleDateFormat set = new SimpleDateFormat("HH:mm");
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	Date mstart;
	
	Date dd;

	

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTimeset() {
		return timeset;
	}
	public void setTimeset(String timeset) {
		this.timeset = timeset;
		Calendar cal = Calendar.getInstance();
		cal.setTime(mstart);
		cal.add(Calendar.HOUR, Integer.parseInt(timeset.substring(0, timeset.lastIndexOf(":"))));
		cal.add(Calendar.MINUTE, Integer.parseInt(timeset.substring(timeset.lastIndexOf(":")+1)));
		dd = cal.getTime();
		
		this.showtime = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(dd);

		
		
	}
	public String getShowdate() {
		return showdate;
	}
	public String getShowtime() {
		return showtime;
	}
	public Integer getsID() {
		return sID;
	}
	public void setsID(Integer sID) {
		this.sID = sID;
	}
	public Integer getScNum() {
		return scNum;
	}
	public void setScNum(Integer scNum) {
		this.scNum = scNum;
	}
	public Integer getmID() {
		return mID;
	}
	public void setmID(Integer mID) {
		this.mID = mID;
	}
	public Date getMstart() {
		return mstart;
		
	}
	public void setMstart(Date mstart) {
		
		this.mstart = mstart;
		this.showdate = dateSch.format(mstart);
		//this.showtime = timeSch.format(mstart);
	}
	@Override
	public String toString() {
		return "TimeTableVO [sID=" + sID + ", scNum=" + scNum + ", mID=" + mID + ", showdate=" + showdate
				+ ", showtime=" + showtime + ", timeset=" + timeset + ", mstart=" + mstart + ", dd=" + dd + "]";
	}
	
	

	
	
	
	
}
