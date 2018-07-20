package com.jhta.proj.model.admin;

import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

@Alias("settleVo")
public class SettleVO {
	
	

	@DateTimeFormat(pattern="yyyy-MM-dd")
	Date mstart;
	String type,id,cost,coc,accnum,title,refund,num,cnt,start,end;
	public Date getMstart() {
		return mstart;
	}
	public void setMstart(Date mstart) {
		this.mstart = mstart;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCost() {
		return cost;
	}
	public void setCost(String cost) {
		this.cost = cost;
	}
	public String getCoc() {
		return coc;
	}
	public void setCoc(String coc) {
		this.coc = coc;
	}
	public String getAccnum() {
		return accnum;
	}
	public void setAccnum(String accnum) {
		this.accnum = accnum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getRefund() {
		return refund;
	}
	public void setRefund(String refund) {
		this.refund = refund;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getCnt() {
		return cnt;
	}
	public void setCnt(String cnt) {
		this.cnt = cnt;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	@Override
	public String toString() {
		return "SettleVO [mstart=" + mstart + ", type=" + type + ", id=" + id + ", cost=" + cost + ", coc=" + coc
				+ ", accnum=" + accnum + ", title=" + title + ", refund=" + refund + ", num=" + num + ", cnt=" + cnt
				+ ", start=" + start + ", end=" + end + "]";
	}
	
	
	
	
}