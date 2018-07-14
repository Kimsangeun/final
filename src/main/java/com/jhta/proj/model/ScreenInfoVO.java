package com.jhta.proj.model;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("screenInfoVo")
public class ScreenInfoVO {

	int sId, scNum, mId;
	Date mstart;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-d HH:mm");
	
	public String getMstartStr() {
		return sdf.format(mstart);
	}
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
		return "ScreenInfoVO [sId=" + sId + ", scNum=" + scNum + ", mId=" + mId + ", mstart=" + mstart + ", sdf=" + sdf
				+ "]";
	}

	


}
