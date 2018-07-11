package com.jhta.proj;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ScreenController {

	@RequestMapping("reservation/screen1")
	public String screen1() {
		return "reservation/screen1";
	}
}
