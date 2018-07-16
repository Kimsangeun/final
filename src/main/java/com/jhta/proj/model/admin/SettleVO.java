package com.jhta.proj.model.admin;

import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

@Alias("settleVo")
public class SettleVO {

	@DateTimeFormat(pattern="yyyy-MM-dd")
	Date mstart;
	String type,id,cost,coc,accnum,mtitle,status,num,cnt;
	
	
	
	public String getCnt() {
		return cnt;
	}

	public void setCnt(String cnt) {
		this.cnt = cnt;
	}

	public Date getMstart() {
		return mstart;
	}

	public void setMstart(Date mstart) {
		this.mstart = mstart;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
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

	public String getMtitle() {
		return mtitle;
	}

	public void setMtitle(String mtitle) {
		this.mtitle = mtitle;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "SettleVO [type=" + type + ", id=" + id + ", cost=" + cost + ", coc=" + coc + ", accnum=" + accnum
				+ ", mtitle=" + mtitle + ", status=" + status + ", num=" + num + "]";
	}

	
	
	
}