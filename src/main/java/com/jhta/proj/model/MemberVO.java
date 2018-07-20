package com.jhta.proj.model;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;


import org.apache.ibatis.type.Alias;

@Alias("memberVo")
public class MemberVO {
	
	String id, pw, newpw, email, name, phone, yy, mm, dd;
	
	Integer out;
	
	Date birth;

	public MemberVO() {
		// TODO Auto-generated constructor stub
	}

	public MemberVO(String id, String pw, String newpw, String email, String name, String phone, String yy, String mm,
			String dd, Integer out, Date birth) {
		super();
		this.id = id;
		this.pw = pw;
		this.newpw = newpw;
		this.email = email;
		this.name = name;
		this.phone = phone;
		this.yy = yy;
		this.mm = mm;
		this.dd = dd;
		this.out = out;
		this.birth = birth;
	}

	public String getNewpw() {
		return newpw;
	}

	public void setNewpw(String newpw) {
		this.newpw = newpw;
	}

	public Integer getOut() {
		return out;
	}

	public void setOut(Integer out) {
		this.out = out;
	}

	public String getYy() {
		return yy;
	}

	public void setYy(String yy) {
		this.yy = yy;
	}

	public String getMm() {
		return mm;
	}

	public void setMm(String mm) {
		this.mm = mm;
	}

	public String getDd() {
		return dd;
	}

	public void setDd(String dd) {
		this.dd = dd;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		
		this.birth = birth;
	}
	
	public Date makeBirth(String yy, String mm, String dd) {
		
		Date bb = Date.valueOf(yy+"-"+mm+"-"+dd);
		
		return bb;
	}

	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", pw=" + pw + ", email=" + email + ", name=" + name + ", phone=" + phone
				+ ", birth=" + birth + "]";
	}
	
	
	//ㅁㄴㅇ
}
