package com.jhta.proj.model;

import java.util.Date;

public class ScreenInfoVO {
	int sId, mId, scNum;
	Date mstart;

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

	@Override
	public String toString() {
		return "ScreenInfoVO [sId=" + sId + ", mId=" + mId + ", scNum=" + scNum + ", mstart=" + mstart + "]";
	}

}
