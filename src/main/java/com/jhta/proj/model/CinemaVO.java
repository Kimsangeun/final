package com.jhta.proj.model;

import org.apache.ibatis.type.Alias;

@Alias("cinemaVo")
public class CinemaVO {
	
	int scNum, totSeat; //��, �� �¼���
String img;


	public String getImg() {
	return img;
}

public void setImg(String img) {
	this.img = img;
}

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

	@Override
	public String toString() {
		return "CinemaVO [scNum=" + scNum + ", totSeat=" + totSeat + ", img=" + img + "]";
	}
}
