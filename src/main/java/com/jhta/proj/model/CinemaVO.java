package com.jhta.proj.model;

import org.apache.ibatis.type.Alias;

@Alias("cinemaVo")
public class CinemaVO {
	
	int scNum, totSeat; //°ü, ÃÑ ÁÂ¼®¼ö

	public int getScNum() {
		return scNum;
	}

	public void setScNum(int scNum) {
		this.scNum = scNum;
	}

	public int getTotSeat() {
		return totSeat;
	}

	public void setTotSeat(int totSeat) {
		this.totSeat = totSeat;
	}
	
	
}
