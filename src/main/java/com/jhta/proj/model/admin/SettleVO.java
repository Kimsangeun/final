package com.jhta.proj.model.admin;

import org.apache.ibatis.type.Alias;

@Alias("settleVo")
public class SettleVO {

	String type;

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "SettleVO [type=" + type + "]";
	}
	
	
}

