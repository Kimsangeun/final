package com.jhta.proj.logic;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.jhta.proj.model.admin.TimeTableVO;

public class timeChk implements Validator{

	//안됌 ..ㅎ
	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		
		TimeTableVO vo = (TimeTableVO)target;
		
		
		if(vo.getMstart()==null)
			errors.rejectValue("timepicker", "invalid.id","날짜입력이요");
	}

	
}
