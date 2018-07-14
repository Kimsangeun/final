package com.jhta.proj.model;

import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.apache.ibatis.type.Alias;

@Alias("reserVo")
public class ReserVO {
	
	String id, seatNum, accNum,coc; //�������̵�, �¼���ȣ
	int rId, cost, sId, mId, cnt; //�����ȣ, ����, ī��, ��, ��ȭ��ȣ	
	

	
	
	public String getAccNum() {
		return accNum;
	}
	public void setAccNum(String accNum) {
		this.accNum = accNum;
	}
	public String getCoc() {
		return coc;
	}
	public void setCoc(String coc) {
		this.coc = coc;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
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
		return "ReserVO [id=" + id + ", seatNum=" + seatNum + ", accNum=" + accNum + ", coc=" + coc + ", rId=" + rId
				+ ", cost=" + cost + ", sId=" + sId + ", mId=" + mId + ", cnt=" + cnt + "]";
	}
	
	
	
}
