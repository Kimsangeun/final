<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.S_log{
float : right;
}

#S_log{
float: left;
margin-left: 10px;
}
</style>

<form action="loginReg" method="post">
<div class="S_log">
	<c:choose>
		<c:when test="${mem eq null }">
			<div id="S_log">ID</div>
			<div id="S_log"><input type="text" name="id"></div>	
			<div id="S_log">pw</div>
			<div id="S_log"><input type="text" name="pw"></div>
			<div id="S_log"><input type="submit" value="로그인"></div>
			<div><a href="">회원가입</a></div>
		</c:when>
		<c:otherwise>
			<div><a href="MyPage">${mem.id }(${mem.name })님</a></div>
			<div><a href="logOut">로그아웃</a></div>
		</c:otherwise>
	</c:choose>
</div>
	
<div style="clear: both;"></div>
</form>