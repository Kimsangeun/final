package com.jhta.proj.model;

import org.apache.ibatis.type.Alias;

@Alias("reserVo")
public class ReserVO {
/*	DB
	회원
	id pw email phone birth(7자리) name mileage

	영화
	mID title nation genre runtime image plot rating release(date) director actor

	상영정보
	sID scNum 날짜(영화시작시간) mID

	예약
	id rID cost sID seatNum mID

	리뷰
	mID id reg_date score review

	게시판(문의, 공지사항, F&Q)

	상영관
	scNum totSeat*/
	
	String id, seatNum; //유저아이디, 좌석번호
	int rId, cash, card, point, sId, mId; //예약번호, 현금, 카드, 포인트, 관, 영화번호
	
	
	
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
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
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
	
}
