<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- <link rel="stylesheet" href="/proj/resources/bootstrap-3.2.0-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/proj/resources/bootstrap-3.2.0-dist/css/bootstrap-theme.min.css">
<script type="text/javascript" src="/proj/resources/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/proj/resources/bootstrap-3.2.0-dist/js/bootstrap.min.js"></script>
 -->
<script>
	$(function() {
		$('ul.nav-tabs a').click(function(e) {
			e.preventDefault()
			$(this).tab('show')
		})
	})
</script>
<div align="center">
	<!-- 전체 디브 -->

	<nav class="navbar navbar-default" style="width:60%">
	<div>
		<ul class="nav navbar-nav nav-tabs" style="width:100%">
			<li class="active" style="width:25%"><a href="#first">1관</a></li>
			<li style="width:25%"><a href="#second">2관</a></li>
			<li style="width:25%"><a href="#third">3관</a></li>
			<li style="width:25%"><a href="#fourth" >4관</a></li>
		</ul>
	</div>
	 
	</nav> 
	<div class="tab-content" style="margin-top: 80px;width:60%">
		<div class="tab-pane fade active in" id="first">
			<p>
				<h2>1관 좌석배치도</h2><br> <img width="100%" src="${pageContext.request.contextPath}/resources/Screenimg/${cinemadata.get(0).img }" />
				<h3>좌석수 : 32석 <br><font style="color:green"> ㅁ </font>일반석 : 3,000원 / <font style="color:red"> ㅁ </font>우등석 : 4,000원</h3>
		</div>
		<div class="tab-pane fade" id="second">
			<p> 
				<h2>2관 좌석배치도</h2><br> <img width="100%" src="${pageContext.request.contextPath}/resources/Screenimg/${cinemadata.get(1).img }" />
				<h3>좌석수 : 40석 <br><font style="color:green"> ㅁ </font>일반석 : 3,000원 / <font style="color:red"> ㅁ </font>우등석 : 4,000원</h3>
		</div>
		<div class="tab-pane fade" id="third">
			<p>
				<h2>3관 좌석배치도</h2><br> <img width="100%" src="${pageContext.request.contextPath}/resources/Screenimg/${cinemadata.get(2).img }" />
				<h3>좌석수 : 32석 <br><font style="color:green"> ㅁ </font>일반석 : 3,000원 / <font style="color:red"> ㅁ </font>우등석 : 4,000원</h3>
		</div>
		<div class="tab-pane fade" id="fourth">
			<p>
				<h2>4관 좌석배치도</h2><br> <img width="100%" src="${pageContext.request.contextPath}/resources/Screenimg/${cinemadata.get(3).img }" />
				<h3>좌석수 : 36석 <br><font style="color:green"> ㅁ </font>일반석 : 3,000원 / <font style="color:red"> ㅁ </font>우등석 : 4,000원</h3>
		</div>
	</div>
</div>
