package com.jhta.proj;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InterceptorController {

	@RequestMapping("event")
	String gogoEvent() {
		
		return "etc/event";
	}
	
	@RequestMapping("qwer")
	String gogoQwer() {
		
		return "etc/qwer";
	}
}
