package com.jhta.proj.model;

import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.apache.ibatis.type.Alias;

@Alias("reserVo")
public class ReserVO {

	String id, seatNum, title; // �������̵�, �¼���ȣ
	int rId, cash, card, sId, mId, cnt, scNum; // �����ȣ, ����, ī��, ��, ��ȭ��ȣ
	Date mstart;

	public int getScNum() {
		return scNum;
	}

	public void setScNum(int scNum) {
		this.scNum = scNum;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public void setCnt(String cnt) {
		
		this.cnt = Integer.parseInt(cnt);
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
		SimpleDateFormat time = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		try {
			this.mstart = time.parse(time.format(mstart));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

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

	@Override
	public String toString() {
		return "ReserVO [id=" + id + ", seatNum=" + seatNum + ", title=" + title + ", rId=" + rId + ", cash=" + cash
				+ ", card=" + card + ", sId=" + sId + ", mId=" + mId + ", cnt=" + cnt + ", scNum=" + scNum + ", mstart="
				+ mstart + "]";
	}

}
