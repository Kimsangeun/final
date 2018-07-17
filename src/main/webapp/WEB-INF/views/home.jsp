<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>중앙박스</title>

<link rel="stylesheet"
	href="/proj/resources/bootstrap-3.2.0-dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/proj/resources/bootstrap-3.2.0-dist/css/bootstrap-theme.min.css">
<script type="text/javascript" src="/proj/resources/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
	src="/proj/resources/bootstrap-3.2.0-dist/js/bootstrap.min.js"></script>


<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<!--  <script src="../../assets/js/ie-emulation-modes-warning.js"></script> -->

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<!-- Custom styles for this template -->
<!--  <link href="/proj/resources/bootstrap-3.2.0-dist/css/dashboard.css" rel="stylesheet"> -->
<link href="/proj/resources/bootstrap-3.2.0-dist/css/carousel.css"
	rel="stylesheet">
<script type="text/javascript">
    	/* alert('aa${mem}'); */
    </script>
</head>
<!-- NAVBAR
================================================== -->
<body>
	<div class="navbar-wrapper" style="margin: 100px">
		<div class="container">

			<nav class="navbar navbar-inverse navbar-fixed-top">
				<div class="container">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse" data-target="#navbar"
							aria-expanded="false" aria-controls="navbar">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="/proj/">크크크크</a>
					</div>
					<div id="navbar" class="navbar-collapse collapse">
						<ul class="nav navbar-nav">
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-expanded="false">영화
									<span class="caret"></span>
							</a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="/proj/movie/boxoffice">박스오피스</a></li>
									<li><a href="/proj/movie/now">현재상영작</a></li>
									<li><a href="/proj/movie/comming">개봉예정작</a></li>
									<!--  <li class="divider"></li>
                    <li class="dropdown-header">Nav header</li>
                    <li><a href="#">Separated link</a></li>
                    <li><a href="#">One more separated link</a></li> -->
								</ul></li>

							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-expanded="false">예매
									<span class="caret"></span>
							</a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="/proj/reservation/reser">빠른예매</a></li>
									<li><a href="/proj/reservation/timetable">상영시간표</a></li>
								</ul></li>

							<li><a href="/proj/screen/screenInfo">영화관</a></li>

							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-expanded="false">고객센터
									<span class="caret"></span>
							</a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="/proj/info/notice">공지사항</a></li>
									<li><a href="/proj/info/faq">자주찾는질문</a></li>
									<li><a href="/proj/info/qna">1:1문의</a></li>
									<li>${mem.id}asdf</li>
								</ul></li>
							<jsp:include page="admin/topmenu.jsp"></jsp:include>
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-expanded="false">로그인
									<span class="caret"></span>
							</a>
								<ul class="dropdown-menu" role="menu">
									<li><jsp:include page="inc/hightop2.jsp" /></li>

								</ul></li>
						</ul>

					</div>
				</div>
			</nav>

		</div>
	</div>

	<!-- Carousel -->
	<c:choose>
		<c:when test="${main==null}">
			<jsp:include page="inc/contents2.jsp" />
		</c:when>
		<c:when test="${main eq 'home' }">
			<jsp:include page="inc/contents2.jsp" />
		</c:when>
		<c:otherwise>
			<div class="container marketing" style="margin-top: 100px">
				<jsp:include page="${menu }/${main }.jsp" />
			</div>
		</c:otherwise>
	</c:choose>





	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!--     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="../../dist/js/bootstrap.min.js"></script> -->
	<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
	<script type="text/javascript"
		src="/proj/resources/bootstrap-3.2.0-dist/js/holder.js"></script>
	<!--     <script src="../../assets/js/vendor/holder.js"></script> -->
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<!--  <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script> -->
</body>
</html>
