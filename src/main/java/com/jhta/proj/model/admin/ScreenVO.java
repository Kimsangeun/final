package com.jhta.proj.model.admin;

import org.apache.ibatis.type.Alias;

@Alias("screenVo")
public class ScreenVO {
	Integer scNum, totSeat;

	public Integer getScNum() {
		return scNum;
	}

	public void setScNum(Integer scNum) {
		this.scNum = scNum;
	}

	public Integer getTotSeat() {
		return totSeat;
	}

	public void setTotSeat(Integer totSeat) {
		this.totSeat = totSeat;
	}

	@Override
	public String toString() {
		return "ScreenVO [scNum=" + scNum + ", totSeat=" + totSeat + "]";
	}
	
	
	
	
}
