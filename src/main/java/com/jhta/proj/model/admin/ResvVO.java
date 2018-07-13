package com.jhta.proj.model.admin;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("resvVo")
public class ResvVO {
	
	String id, seatNum, title;
	Date mstart;
	int rId, cash, card, sId, mId,scNum; 
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSeatNum() {
		return seatNum;
	}
	public void setSeatNum(String seatNum) {
		this.seatNum = seatNum;
	}
	public int getrId() {
		return rId;
	}
	public void setrId(int rId) {
		this.rId = rId;
	}
	public int getCash() {
		return cash;
	}
	public void setCash(int cash) {
		this.cash = cash;
	}
	public int getCard() {
		return card;
	}
	public void setCard(int card) {
		this.card = card;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getMstart() {
		return mstart;
	}
	public void setMstart(Date mstart) {
		this.mstart = mstart;
	}
	public int getScNum() {
		return scNum;
	}
	public void setScNum(int scNum) {
		this.scNum = scNum;
	}
	
	@Override
	public String toString() {
		return "ResvVO [id=" + id + ", seatNum=" + seatNum + ", title=" + title + ", mstart=" + mstart + ", rId=" + rId
				+ ", cash=" + cash + ", card=" + card + ", sId=" + sId + ", mId=" + mId + ", scNum=" + scNum + "]";
	}
	
	
	
}
