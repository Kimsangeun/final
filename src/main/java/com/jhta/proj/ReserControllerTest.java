package com.jhta.proj;

import static org.junit.Assert.*;

import java.util.Collection;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.ui.Model;

import com.jhta.proj.model.MovDAO;
import com.jhta.proj.model.MovVO;
import com.jhta.proj.model.ReserDAO;
import com.jhta.proj.model.ScreenInfoVO;

public class ReserControllerTest {
	HttpServletRequest request;
	
	@Resource
	MovDAO mdao;
	
	@Resource
	ReserDAO rdao;
	
	Model model = new Model() {
		@Override
		public Model mergeAttributes(Map<String, ?> attributes) {
			// TODO Auto-generated method stub
			return null;
		}
		@Override
		public boolean containsAttribute(String attributeName) {
			// TODO Auto-generated method stub
			return false;
		}
		@Override
		public Map<String, Object> asMap() {
			// TODO Auto-generated method stub
			return null;
		}
		@Override
		public Model addAttribute(String attributeName, Object attributeValue) {
			// TODO Auto-generated method stub
			return null;
		}
		@Override
		public Model addAttribute(Object attributeValue) {
			// TODO Auto-generated method stub
			return null;
		}
		@Override
		public Model addAllAttributes(Map<String, ?> attributes) {
			// TODO Auto-generated method stub
			return null;
		}
		@Override
		public Model addAllAttributes(Collection<?> attributeValues) {
			// TODO Auto-generated method stub
			return null;
		}
	};
	
/*	@Test
	public void testDatelist() {
		fail("Not yet implemented");
	}

	@Test
	public void testCinema() {
		fail("Not yet implemented");
	}

	@Test
	public void testMov() {
		fail("Not yet implemented");
	}

	@Test
	public void testDat() {
		fail("Not yet implemented");
	}

	@Test
	public void testTit() {
		fail("Not yet implemented");
	}*/

	@Test
	public void testRese() {
		ReserController rr = new ReserController();
		ReserDAO rdao = new ReserDAO();
		
		System.out.println(rdao.list());
		
		
	}
	
/*	@Test
	public void testDatetitlelist() {
		fail("Not yet implemented");
	}
*/
	
	@Test
	public void testCine3() { //timetable
		ReserController rr = new ReserController();
		String res = (String)rr.cine3(model);
		
		assertEquals("home", res);
	}
	 
	@Test
	public void testCine2() { //reser
		ReserController rr = new ReserController();
		String res = (String)rr.cine2(model);
		
		assertEquals("home", res);
	}
	
	/*
	@Test
	public void testCine6() { //screenchoice
		fail("Not yet implemented");
	}

	@Test
	public void testCine24() { //payment
		fail("Not yet implemented");
	}

	@Test
	public void testCine5() { //payend
		fail("Not yet implemented");
	}

	@Test
	public void testCine4() { //forbidden
		fail("Not yet implemented");
	}

	@Test
	public void testReadFile() {
		fail("Not yet implemented");
	}*/

}
