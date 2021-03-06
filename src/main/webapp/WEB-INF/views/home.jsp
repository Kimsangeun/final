<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<meta name="viewport"
	content="width=device-width, initial-scale=1.0 , 
user-scalable=0, minimum-scale=1.0, maximum-scale=1.0" />
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<title>시네마중앙</title>


<link rel="stylesheet"
	href="/proj/resources/bootstrap-3.2.0-dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/proj/resources/bootstrap-3.2.0-dist/css/bootstrap-theme.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- <script type="text/javascript" src="/proj/resources/jquery-3.3.1.min.js"></script> -->
<script type="text/javascript"
	src="/proj/resources/bootstrap-3.2.0-dist/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">

<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script type="text/javascript"
	src="/proj/resources/js/jquery.raty.min.js"></script>
<script type="text/javascript" src="/proj/resources/js/js-load.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>

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
<style type="text/css">
html, body {
	height: 100%
}
</style>


</head>
<style>
@media screen and (min-width : 768px) {
	.navbar .navbar-nav {
		display: inline-block;
		float: none;
	}
	.navbar .navbar-collapse {
		text-align: left;
	}
}

@media screen and (max-width : 768px) {
	#navbar {
		z-index: 2;
	}
	#main {
		z-index: 1;
	}
}

</style>

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
						<a class="hidden-sm hidden-md hidden-lg navbar-brand"
							href="/proj/"> <img src="/proj/resources/imgs/cinemalogo.png"
							width="130px" /></a>

					</div>
					<div id="navbar" class="navbar-collapse collapse">
						<ul class="nav navbar-nav">
							<li class="hidden-xs "><a class="navbar-brand" href="/proj/">
									<img src="/proj/resources/imgs/cinemalogo.png" width="130px" />
							</a></li>

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
								</ul></li>
							<jsp:include page="admin/topmenu.jsp"></jsp:include>
							<li><jsp:include page="mypage/topmenu.jsp"></jsp:include> <c:choose>
									<c:when test="${mem.id == null }">
										<%-- <li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-expanded="false">로그인
									<span class="caret"></span>
							</a>
								<ul class="dropdown-menu" role="menu">
									<li><jsp:include page="inc/hightop2.jsp" /></li>

								</ul></li> --%>
										<li data-toggle="modal" data-target="#myModal"><a
											href="#">로그인</a></li>

										<!-- Modal -->

									</c:when>
									<c:otherwise>
										<li class=""><a href="/proj/logOut" role="button"
											aria-expanded="false">로그아웃
										</a></li>
									</c:otherwise>
								</c:choose></li>
						</ul>
						<ul class="nav navbar-nav navbar-right">

						</ul>

					</div>
				</div>
			</nav>

		</div>
	</div>




	<!-- 본체 -->
	<div id="main" style="margin-top: 50px">
		<jsp:include page="inc/login.jsp" />
		<c:choose>
			<c:when test="${main==null}">
				<jsp:include page="inc/contents2.jsp" />
			</c:when>
			<c:when test="${main eq 'home' }">
				<jsp:include page="inc/contents2.jsp" />
			</c:when>
			<c:otherwise>
				<div class="container">
					<jsp:include page="${menu }/${main }.jsp" />
				</div>
			</c:otherwise>
		</c:choose>

		<!-- 로그인 모달~~~ -->
		<div class="modal fade" id="noLoginModal" tabindex="-1" role="dialog"
			aria-labelledby="noLoginModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="noLoginModalLabel">로그인 필요</h4>
					</div>
					<div class="modal-body">로그인 후 이용 가능한 서비스 입니다.</div>
					<div class="modal-footer">
						<button id="noLoginModalOk" type="button" data-dismiss="modal"
							class="btn btn-primary">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>




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
