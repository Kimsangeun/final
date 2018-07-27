package com.jhta.proj;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class CenterControllerTest {

	@Test
	public void testSelectList() {
		CenterController testControl = new CenterController();
		
		String res = testControl.aaa("insertReg");
		
		System.out.println("res::"+res);
		assertEquals("/admin/alert", res);
	}

}
