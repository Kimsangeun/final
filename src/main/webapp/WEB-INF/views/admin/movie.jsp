<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    

<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="http://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<style>


</style>

<script>

</script>


<div class="page-header">
  <h1>영화관리 <small></small></h1>
</div>
<div class="container">
<!-- <input type="button" value="추가" onclick="location.href='insertMovieForm'"> -->
<table class="table table-hover" >

	<thead>	
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>런타임</th>
		<th>개봉일</th>
		<th>삭제</th>
		<th>변경</th>
		<!-- <td>날짜</td> -->
	</tr>	
	</thead>
	<tbody>
<c:forEach items="${data['movie'] }" var="mm" varStatus="no">
	<tr>
		<td>${mm.mid}</td>
		<td><a href="/proj/movie/detailMovie?mid=${mm.mid }">${mm.title}</a></td>
		<td>${mm.runtime}</td>
		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${mm.release}"/></td>
		<td><input class="btn btn-danger" type="button" value="X" onclick="location.href='deleteMovie?mid=${mm.mid}'"></td>
		<td><a href="modifyForm?mid=${mm.mid }">Modify</a></td>
	</tr>
</c:forEach>

</tbody>
</table>
<button type="button" class="btn btn-danger pull-right" onclick="location.href='insertMovieForm'">추가</button>
<div class="center-block">
<nav>
  <ul class="pagination">
  	<c:if test="${startPage >1 }">
	<li><a href="movie?page=1" aria-label="Previous"><span aria-hidden="true">[처음]</span></a></li>
	<li>
      <a href="movie?page=${startPage-1 }" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
	</c:if>
    <%-- <li>
      <a href="movie?page=${startPage-1 }" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li> --%>
    
    <c:forEach var="i" begin="${startPage }" end="${endPage }">
	    <c:choose>
			<c:when test="${i==page }">
				<li class="active"><a href="#">${i }</a></li>
			</c:when>
			<c:otherwise>
				<li class=""><a href="movie?page=${i }">${i }</a></li>
			</c:otherwise>
		</c:choose>
    </c:forEach>
    <c:if test="${endPage<totalPage}"></c:if>
    <li>
      <a href="movie?page=${endPage+1 }" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
    <li>
      <a href="movie?page=${totalPage }" aria-label="Next">
        <span aria-hidden="true">마지막</span>
      </a>
    </li>
  </ul>
</nav>

</div>

</div>