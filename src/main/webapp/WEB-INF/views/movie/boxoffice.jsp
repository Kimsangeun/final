
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- width: 232px; height: 500px;  -->
<<script type="text/javascript">
$(document).ready(function() {
	   var maxHeight = -1;

	   $('.features').each(function() {
	     maxHeight = maxHeight > $(this).height() ? maxHeight : $(this).height();
	   });

	   $('.features').each(function() {
	     $(this).height(maxHeight);
	   });
	 });
</script>
	<div class="container-fluid" style="margin-top: 100px">
		<div class="row">

			<c:forEach begin="1" end="12" items="${moviedata}" var="mm"
				varStatus="no">
				<div class="features col-lg-2 col-xs-6 col-sm-4 col-md-4"  align="center" 
					style="border: 1px solid gray;"
					>
					
					<a href="/proj/movie/detailMovie?mid=${mm.mid }"> <img
						style="width: 100%"
						src="${pageContext.request.contextPath}\resources\movposter/${mm.poster}"
						alt="Generic placeholder image">
					</a>
					
				<%-- <div  align="center"
				 style="width: 232px; height: 500px; margin: 5px;border: 1px solid gray;"
					class="col-lg-2 col-xs-6 col-sm-4 col-md-4 movietool">
					<a href="/proj/movie/detailMovie?mid=${mm.mid }"> <img
						style="width: 100%; height: 336px"
						src="${pageContext.request.contextPath}\resources\movposter/${mm.poster}"
						alt="Generic placeholder image">
					</a> --%>
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

		</div>
	</div>
