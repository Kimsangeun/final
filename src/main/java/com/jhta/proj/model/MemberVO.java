package com.jhta.proj.model;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("memberVo")
public class MemberVO {
	
	String id, pw, email, name, phone;
	
	Date birth;

	public MemberVO() {
		// TODO Auto-generated constructor stub
	}
	
	public MemberVO(String id, String pw, String email, String name, String phone, Date birth) {
		super();
		this.id = id;
		this.pw = pw;
		this.email = email;
		this.name = name;
		this.phone = phone;
		this.birth = birth;
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

	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", pw=" + pw + ", email=" + email + ", name=" + name + ", phone=" + phone
				+ ", birth=" + birth + "]";
	}
	
	
	
}
