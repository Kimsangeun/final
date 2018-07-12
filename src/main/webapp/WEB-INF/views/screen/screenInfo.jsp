<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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
				1관 좌석배치도<br> <img src="../resources/screenimg/${cinemadata.get(0).img }" />
			</p>
		</div>
		<div class="tab-pane fade" id="second">
			<p>
				2관 좌석배치도<br> <img src="../resources/screenimg/${cinemadata.get(1).img }" />
		</div>
		<div class="tab-pane fade" id="third">
			<p>
				3관 좌석배치도<br> <img src="../resources/screenimg/${cinemadata.get(2).img }" />
		</div>
		<div class="tab-pane fade" id="fourth">
			<p>
				4관 좌석배치도<br> <img src="../resources/screenimg/${cinemadata.get(3).img }" />
		</div>


	</div>


</div>
