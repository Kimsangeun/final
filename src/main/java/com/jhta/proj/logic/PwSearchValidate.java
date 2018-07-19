package com.jhta.proj.logic;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.jhta.proj.model.MemberDAO;
import com.jhta.proj.model.MemberVO;

public class PwSearchValidate implements Validator{

	
	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		
		MemberVO vo = (MemberVO)target;
		
		if(vo.getId() ==null || vo.getId().trim().equals("")) {
			
			errors.rejectValue("id", "invalid.id", "id입력이 필요합니다.");
			
		}else if(vo.getName() ==null || vo.getName().trim().equals("")) {
			
			errors.rejectValue("name", "invalid.name", "이름입력이 필요합니다.");
			
		}else if(vo.getPhone() ==null || vo.getPhone().trim().equals("")) {
			
			errors.rejectValue("phone", "invalid.phone", "휴대전화번호입력이 필요합니다.");
			
		}
	
	}

}
