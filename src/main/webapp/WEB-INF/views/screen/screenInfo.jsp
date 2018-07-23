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
<div>
	<!-- 전체 디브 -->

	<nav class="navbar navbar-default">
	<div>
		<ul class="nav navbar-nav nav-tabs">
			<li class="active"><a href="#first">1관</a></li>
			<li><a href="#second">2관</a></li>
			<li><a href="#third">3관</a></li>
			<li><a href="#fourth">4관</a></li>
		</ul>
	</div>
	</nav>
	<div class="tab-content" style="margin-top: 80px;">
		<div class="tab-pane fade active in" id="first">
			<p>
				1관 좌석배치도<br> <img src="${pageContext.request.contextPath}/resources/Screenimg/${cinemadata.get(0).img }" />
				<img src="../resources/screenimg/Screen1.JPG"/>
			</p>
		</div>
		<div class="tab-pane fade" id="second">
			<p>
				2관 좌석배치도<br> <img src="${pageContext.request.contextPath}/resources/Screenimg/${cinemadata.get(1).img }" />
		</div>
		<div class="tab-pane fade" id="third">
			<p>
				3관 좌석배치도<br> <img src="${pageContext.request.contextPath}/resources/Screenimg/${cinemadata.get(2).img }" />
		</div>
		<div class="tab-pane fade" id="fourth">
			<p>
				4관 좌석배치도<br> <img src="${pageContext.request.contextPath}/resources/Screenimg/${cinemadata.get(3).img }" />
		</div>


	</div>


</div>
