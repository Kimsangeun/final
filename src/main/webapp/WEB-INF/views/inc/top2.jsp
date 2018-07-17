<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <link href="../dashboard.css" rel="stylesheet"> -->
<title>Insert title here</title>
</head>
 
<style>
/* .navbar .navbar-nav {

  display: inline-block;

  float: none;

}
.navbar .navbar-collapse {

  text-align: center;

} */
/*  a{
color: black;
text-decoration: none;
text-align: left;
}

.S_top{
float: left;
padding : 15px 0;
margin: 0 10%;
} */
</style> 



<body>
	<ul class="nav navbar-nav navbar">
		<li class="dropdown"><a href="#" class="dropdown-toggle"
			data-toggle="dropdown" role="button" aria-expanded="false">영화
				<span class="caret"></span>
		</a>
			<ul class="dropdown-menu" role="menu">
				<li><a href="/proj/movie/boxoffice">박스오피스</a></li>
				<li><a href="/proj/movie/now">현재상영작</a></li>
				<li><a href="/proj/movie/comming">개봉예정작</a></li>
			</ul>
		</li>
		<li class="dropdown"><a href="#" class="dropdown-toggle"
			data-toggle="dropdown" role="button" aria-expanded="false">예매
				<span class="caret"></span>
		</a>
			<ul class="dropdown-menu" role="menu">
				<li><a href="/proj/reservation/reser">빠른예매</a></li>
				<li><a href="/proj/reservation/timetable">상영시간표</a></li>
			</ul>
		</li>
		<li><a href="/proj/screen/screenInfo">영화관</a></li>
		<li class="dropdown"><a href="#" class="dropdown-toggle"
			data-toggle="dropdown" role="button" aria-expanded="false">고객센터
				<span class="caret"></span>
		</a>
			<ul class="dropdown-menu" role="menu">
				<li><a href="/proj/info/notice">공지사항</a></li>
				<li><a href="/proj/info/faq">자주찾는질문</a></li>
				<li><a href="/proj/info/qna">1:1문의</a></li>
			</ul>
		</li>
		<!-- <li><a href="/proj/movie/boxoffice">영화</a></li>
		<li><a href="/proj/reservation/reser">예매</a></li>
		<li><a href="/proj/screen/screenInfo">영화관</a></li>
		<li><a href="/proj/info/notice">고객센터</a></li> -->
	</ul>
</body>
</html>