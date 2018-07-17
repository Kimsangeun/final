<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>

<!-- 
<style>
a{
color: black;
text-decoration: none;
text-align: left;
}

.S_top{
float: left;
padding : 15px 0;
margin: 0 10%;
}
</style>
 -->

<body>
	<ul class="nav navbar-nav navbar-right">
	<c:choose>
		<c:when test="${mem eq null }">
		<li><form action="/proj/loginReg" method="post">
			ID<input type="text" name="id">
			pw<input type="text" name="pw">
			<input type="submit" value="로그인">
			<a href="/proj/joinForm">회원가입</a>
		</form></li>
		</c:when>
		<c:otherwise>
			<c:choose>
				<c:when test="${mem.id eq 'admin' }">
					<li><div><a href="/proj/admin/time">관리자페이지</a></div></li>
				</c:when>
				<c:otherwise>
					<li><div><a href="/proj/mypage/reser">${mem.id }(${mem.name })님</a></div></li>
				</c:otherwise>
			</c:choose>
			<li><div><a href="/proj/logOut">로그아웃</a></div></li>
		</c:otherwise>
	</c:choose>
		<!-- <li><a href="/proj/movie/boxoffice">영화</a></li>
		<li><a href="/proj/reservation/reser">예매</a></li>
		<li><a href="/proj/screen/screenInfo">영화관</a></li>
		<li><a href="/proj/info/notice">고객센터</a></li> -->
	</ul>
</body>
</html>