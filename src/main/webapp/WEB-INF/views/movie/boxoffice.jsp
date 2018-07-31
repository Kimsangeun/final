<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script type="text/javascript">
/* $(document).ready(function() {
	   var maxHeight = -1;

	   $('.features').each(function() {
	     maxHeight = maxHeight > $(this).height() ? maxHeight : $(this).height();
	   });

	   $('.features').each(function() {
	     $(this).height(maxHeight);
	   });
	 });
 */


$(window).on('load', function () {
	load('#js-load', '4');
	$("#js-btn-wrap .button").on("click", function () {
		load('#js-load', '4', '#js-btn-wrap');
	})
	
});

</script>
<style>
.js-load {
	display: none;
}

.js-load.showMore {
	display: block;
}

.is_comp.js-load:after {
	display: none;
}

.btn-wrap, .lists, .main {
	display: block;
}


/* @media screen and (max-width : 600px){
.movietool{
	height:300px;
}
img{
	height:100%;
}
}

@media screen and (min-width : 600px){
.movietool{
	height:500px;
}
} */
</style>
<div style="margin-top:50px"><h2>박스오피스</h2></div>

<hr>
<div id="js-load" class="container" style="margin-top: 100px">
	<div class="row">
	
		<c:forEach items="${moviedata}" var="mm" varStatus="no">

			<div align="center" style="height:500px"
				class="features col-lg-3 col-xs-6 col-sm-3 col-md-3 movietool js-load">
				<div class="img">
				<a href="/proj/movie/detailMovie?mid=${mm.mid }"> <img
					class="img-responsive"
					src="${pageContext.request.contextPath}\resources\movposter/${mm.poster}"
					alt="Generic placeholder image">
				</a>
				</div>
				<p>${mm.title}</p>
				<c:choose>
					<c:when test="">

					</c:when>
					<c:otherwise>

					</c:otherwise>
				</c:choose>
				<div class="fixedStar" id="Star_${no.index }"></div>
				<script type="text/javascript">
				$(function() {
				    $('#Star_${no.index }').raty({
				    	size:24,
						half:true,
						path:'/proj/resources/imgs/',
						scoreName:'rating',
/* 						starHalf:'star-half-big.png',
						starOn:'star-on-big.png',
						starOff:'star-off-big.png', */
				    	  readOnly:  true,
				    	  start:   ${mm.rating/2}
				    	});
				});
				</script>
				<p>
					<a class="btn btn-default"
						href="/proj/movie/detailMovie?mid=${mm.mid }" role="button">상세정보
						&raquo;</a> <a class="btn btn-default" href="/proj/reservation/reser" role="button">예매하기
						&raquo;</a>
				</p>

			</div>
			
		</c:forEach>

	</div>
	<div align="center" id="js-btn-wrap" class="btn-wrap">
		<button id="moreButton" class="button btn btn-default">더보기</button>
		<!-- <a href="javascript:;" class="button">더보기</a> -->
	</div>
</div>
