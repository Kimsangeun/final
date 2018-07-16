package com.jhta.proj.model.admin;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("memVo")
public class MemVO {
	
	String id, pw, email, name, phone;
	
	Integer out;
	
	Date birth;

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

	public Integer getOut() {
		return out;
	}

	public void setOut(Integer out) {
		this.out = out;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	@Override
	public String toString() {
		return "MemVO [id=" + id + ", pw=" + pw + ", email=" + email + ", name=" + name + ", phone=" + phone + ", out="
				+ out + ", birth=" + birth + "]";
	}
	
	
}
