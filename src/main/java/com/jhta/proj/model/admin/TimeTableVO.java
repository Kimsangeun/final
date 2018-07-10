package com.jhta.proj.model.admin;




import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

@Alias("timeVo")
public class TimeTableVO {
	Integer sID,scNum,mID;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	Date mstart;
	
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
	}
	@Override
	public String toString() {
		return "TimeTableVO [sID=" + sID + ", scNum=" + scNum + ", mID=" + mID + ", mstart=" + mstart + "]";
	}
	
	
	
	
}
