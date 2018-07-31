<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:forEach items="${moviedata}" var="dd" varStatus="no">
		<img src="${pageContext.request.contextPath}\resources\movposter/${dd.poster}" />
		${dd.title }
</c:forEach> --%>

<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<script type="text/javascript">

/* var i = 0;
$(document).ready(function() {
 
    var currentPage = 1;
    checkForHash();
 
    $(‘#btn1’).add(‘#btn2’).add(‘#btn3’).bind(‘click’, function(e) {
        currentPage = $(this).val();
        showPage($(this).val());
    });
 
    $(‘#link’).bind(‘click’, function(e) {
        document.location.hash = “#” + currentPage;
    });
});
 
function checkForHash() {
    if(document.location.hash){
        var HashLocationName = document.location.hash;
        HashLocationName = HashLocationName.replace(“#”,”“);
        $(“#display”).html(HashLocationName)
    } else {
        $(“#display”).html($(‘#btn1’).val())
    }
}
 
function showPage(value) {
    $(“#display”).html(value)
} */



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

.short_txt01 {overflow:hidden;white-space:nowrap;text-overflow:ellipsis}
</style>

<div style="margin-top:50px"><h2>현재상영작</h2></div>

<hr>

<div id="js-load" class="container" style="margin-top: 100px">
		<%-- <div class="row">
			<c:forEach items="${moviedata}" var="mm"
				varStatus="no">
				<div align="center" style="border: 1px solid lightgray"
					class="features col-lg-3 col-xs-6 col-sm-4 col-md-4 movietool js-load">
					<a href="/proj/movie/detailMovie?mid=${mm.mid }"> <img
						class="img-responsive"
						src="${pageContext.request.contextPath}\resources\movposter/${mm.poster}"
						alt="Generic placeholder image">
					</a>
					<p>${mm.title}</p>
					<c:choose>
						<c:when test="">

						</c:when>
						<c:otherwise>

						</c:otherwise>
					</c:choose>
					<p>${mm.rating}</p>
					<p>
						<a class="btn btn-default"
							href="/proj/movie/detailMovie?mid=${mm.mid }" role="button">상세정보
							&raquo;</a> <a class="btn btn-default" href="#" role="button">예매하기
							&raquo;</a>
					</p>

				</div>
			</c:forEach>

		</div> --%>
		
		<div class="row" >

        	<c:forEach items="${moviedata}" var="mm" varStatus="no">
        		<div align="center" class="col-lg-3 col-xs-6 col-sm-4 col-md-3 js-load" style="height:500px">
        		<a href="/proj/movie/detailMovie?mid=${mm.mid }">
        		<img class="img-responsive" src="${pageContext.request.contextPath}\resources\movposter/${mm.poster}" alt="Generic placeholder image" >
        		</a>
        		<p class="hidden-xs h3 short_txt01">${mm.title}</p>
				<div class="fixedStar" id="Star_${no.index }"></div>
				<script type="text/javascript">
				$(function() {
				    $('#Star_${no.index }').raty({
				    	size:24,
						half:true,
						path:'/proj/resources/imgs/',
						scoreName:'rating',
						starHalf:'star-half-big.png',
						starOn:'star-on-big.png',
						starOff:'star-off-big.png',
				    	  readOnly:  true,
				    	  start:   ${mm.rating/2}
				    	});
				});
				</script>

        		<p><a class="btn btn-default" href="/proj/movie/detailMovie?mid=${mm.mid }" role="button">상세정보 &raquo;</a>
        		<a class="btn btn-default" href="/proj/reservation/reser" role="button">예매하기 &raquo;</a></p>
        		
        		</div>
        	</c:forEach>
   
      </div>
		<div align="center" id="js-btn-wrap" class="btn-wrap">
		<button id="moreButton" class="button btn btn-default">더보기</button>
		<!-- <a href="javascript:;" class="button">더보기</a> -->
		</div>
	</div>
