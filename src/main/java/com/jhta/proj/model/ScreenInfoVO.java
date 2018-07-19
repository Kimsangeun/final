package com.jhta.proj.model;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("screenInfoVo")
public class ScreenInfoVO {

	int sId, scNum, mId, grade;
	Date mstart;
	String mdate, mtime, movtitle;
	
/*	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-d HH:mm");
	SimpleDateFormat sdft = new SimpleDateFormat("HH:mm");
	SimpleDateFormat sdfd = new SimpleDateFormat("yyyy-M-d");
	
	public String getDateSet() {
		
		Date now = new Date();
		
		for (int i = 0; i < 15; i++) {
			Date dlist = new Date(now.getYear(), now.getMonth(), now.getDate()+i);
			if(sdfd.format(dlist).equals(sdfd.format(mstart))) {
				return sdfd.format(dlist);	
			}
		}
		return null;
	}*/
	
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getMovtitle() {
		return movtitle;
	}
	public void setMovtitle(String movtitle) {
		this.movtitle = movtitle;
	}
	public String getMdate() {
		return mdate;
	}
	public void setMdate(String mdate) {
		this.mdate = mdate;
	}
	public String getMtime() {
		return mtime;
	}
	public void setMtime(String mtime) {
		this.mtime = mtime;
	}
/*	public String getMstartStr() {
		return sdf.format(mstart);
	}
	public String getMstartTimeStr() {
		return sdft.format(mstart);
	}*/
	public int getScNum() {
		return scNum;
	}
	public void setScNum(int scNum) {
		this.scNum = scNum;
	}
	public Date getMstart() {
		return mstart;
	}
	public void setMstart(Date mstart) {
		this.mstart = mstart;
	}
	public int getsId() {
		return sId;
	}
	public void setsId(int sId) {
		this.sId = sId;
	}
	public int getmId() {
		return mId;
	}
	public void setmId(int mId) {
		this.mId = mId;
	} 



	@Override
	public String toString() {
		return "ScreenInfoVO [sId=" + sId + ", scNum=" + scNum + ", mId=" + mId + ", mstart=" + mstart + ", mdate="
				+ mdate + ", mtime=" + mtime + ", movtitle=" + movtitle + "]";
	}

	

	


}
