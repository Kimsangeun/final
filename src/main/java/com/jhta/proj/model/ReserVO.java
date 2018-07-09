package com.jhta.proj.model;

import org.apache.ibatis.type.Alias;

@Alias("reserVo")
public class ReserVO {
/*	DB
	ȸ��
	id pw email phone birth(7�ڸ�) name mileage

	��ȭ
	mID title nation genre runtime image plot rating release(date) director actor

	������
	sID scNum ��¥(��ȭ���۽ð�) mID

	����
	id rID cost sID seatNum mID

	����
	mID id reg_date score review

	�Խ���(����, ��������, F&Q)

	�󿵰�
	scNum totSeat*/
	
	String id, seatNum; //�������̵�, �¼���ȣ
	int rId, cash, card, point, sId, mId; //�����ȣ, ����, ī��, ����Ʈ, ��, ��ȭ��ȣ
	
	
	
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
