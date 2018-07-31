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

/* 
$(window).on('load', function () {
	load('#js-load', '4');
	$("#js-btn-wrap .button").on("click", function () {
		load('#js-load', '4', '#js-btn-wrap');
	})
	
}); */

</script>
  <div style="margin-top:50px"><h2>상영예정작</h2></div>
  <hr>
<div class="container" style="margin-top: 100px">
	<jsp:useBean id="now" class="java.util.Date" />
	<%-- <fmt:parseNumber value="${(now.time - now.time) / (1000*60*60*24) }"
			integerOnly="true" /> --%>
	<%-- <div class="row">

		<c:forEach items="${moviedata}" var="mm" varStatus="no">
			<fmt:formatDate value="${mm.release}" var="date" pattern="yyyy.MM.dd" />
			<div class="movietool" align="center"
				style="width: 232px; height: 500px; margin: 5px; border: 1px solid gray;"
				class="col-lg-3 col-xs-6 col-sm-4 col-md-4">
				<a href="/proj/movie/detailMovie?mid=${mm.mid }"> <img
					style="width: 100%; height: 336px"
					src="${pageContext.request.contextPath}\resources\movposter/${mm.poster}"
					alt="Generic placeholder image">
				</a>

				<p style="margin-top:10px"><span class="h4">${date}&nbsp&nbsp&nbsp</span>
					<span class="h3 bg-primary" style="border-radius: 5px; padding:5px 15px 5px 15px;">
					D&nbsp-
					<fmt:parseNumber
						value="${(mm.release.time - now.time)  / (1000*60*60*24)+1}"
						integerOnly="true" /></span></p>
			
				<p class="h3">${mm.title}</p>
				<p>
					<a class="btn btn-default"
						href="/proj/movie/detailMovie?mid=${mm.mid }" role="button">상세정보
						&raquo;</a> <a class="btn btn-default" href="#" role="button">예매하기
						&raquo;</a>
				</p>

			</div>
		</c:forEach>

	</div> --%>
	
	<div class="row">
	
		<c:forEach items="${moviedata}" var="mm" varStatus="no">
			<fmt:formatDate value="${mm.release}" var="date" pattern="yyyy.MM.dd" />
			<div align="center" style="height:500px"
				class="features col-lg-3 col-xs-6 col-sm-3 col-md-3 movietool js-load">
				<div class="img">
				<a href="/proj/movie/detailMovie?mid=${mm.mid }"> <img
					class="img-responsive " data-src="holder.js/250x370/auto"
					src="${pageContext.request.contextPath}\resources\movposter/${mm.poster}"
					alt="Generic placeholder image">
				</a>
				</div>
				<p style="margin-top:10px"><span class="h4">${date}&nbsp&nbsp&nbsp</span>
					<span class="h3 bg-primary" style="border-radius: 5px; padding:5px 15px 5px 15px;">
					D&nbsp-
					<fmt:parseNumber
						value="${(mm.release.time - now.time)  / (1000*60*60*24)+1}"
						integerOnly="true" /></span></p>
			
				<p class="h3">${mm.title}</p>
				<p>
				
					<a class="btn btn-default ${(((mm.release.time - now.time)  / (1000*60*60*24)+1) < 7) ? '':'col-lg-12 col-md-12'}"
						href="/proj/movie/detailMovie?mid=${mm.mid }" role="button">상세정보
						&raquo;</a> 
						<c:if test="${((mm.release.time - now.time)  / (1000*60*60*24)+1) < 7}">
						<a class="btn btn-default" href="/proj/reservation/reser" role="button">예매하기
						&raquo;</a>
						</c:if>
				</p>

			</div>
			
		</c:forEach>

	</div>
</div>