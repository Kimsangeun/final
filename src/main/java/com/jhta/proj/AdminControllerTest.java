package com.jhta.proj;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.Collection;
import java.util.Enumeration;
import java.util.Locale;
import java.util.Map;

import javax.servlet.AsyncContext;
import javax.servlet.DispatcherType;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.ui.Model;

import com.jhta.proj.model.BoardVO;
import com.jhta.proj.model.admin.MovieVO;
import com.jhta.proj.model.admin.SettleVO;
import com.jhta.proj.model.admin.TimeTableVO;


public class AdminControllerTest {
	HttpServletRequest request; //돼라
	
	Model model = new Model() {
		@Override
		public Model mergeAttributes(Map<String, ?> attributes) {return null;}
		@Override
		public boolean containsAttribute(String attributeName) {return false;}
		@Override
		public Map<String, Object> asMap() {return null;}
		@Override
		public Model addAttribute(String attributeName, Object attributeValue) {return null;}
		@Override
		public Model addAttribute(Object attributeValue) {	return null;}
		@Override
		public Model addAllAttributes(Map<String, ?> attributes) {	return null;}
		@Override
		public Model addAllAttributes(Collection<?> attributeValues) {	return null;}
	};
	
	@Test
	public void testSelectList() {
		//fail("Not yet implemented");
		AdminController a = new AdminController();
		String res = a.selectList("deleteMovie", new TimeTableVO(),model);
		
		System.out.println(res);
		
		assertEquals("메시지", "admin/alert", res);
	}

	@Test
	public void testSss() {
		//fail("Not yet implemented");
		
		AdminController a = new AdminController();
		String res = a.sss("time",new SettleVO(),new BoardVO() ,new TimeTableVO(), model);
		
		System.out.println(res);
		
		assertEquals("메시지", "home", res);
	}

	@Test
	public void testRes() {
		//fail("Not yet implemented");
		AdminController a = new AdminController();
		Object res = a.res("",new MovieVO() ,new TimeTableVO() ,new SettleVO() ,new BoardVO()
			,model,request);
	}

	@Test
	public void testFileUP() {
		fail("Not yet implemented");
	}

	@Test
	public void testFilesUP() {
		fail("Not yet implemented");
	}

	@Test
	public void testDeleteFile() {
		fail("Not yet implemented");
	}

}
