<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    


<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="http://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>


<script>

</script>


<div class="table-responsive container">
<table class="table table-hover" >

<thead class="thead-dark">
	<tr>
		<th>번호</th>
		<th>ID</th>
		<th>영화제목</th>
		<th>상영시간</th>
		<th>상영관</th>
		<th>좌석번호</th>
		<th>금액</th>
		<!-- <td>변경</td> -->
		<!-- <td>날짜</td> -->
	</tr>	
</thead>
<tbody>
<c:forEach items="${data }" var="mm" varStatus="no">
	<tr>
		<td>${no.index}</td>
		<td>${mm.id}</td>
		<td>${mm.title}</td>
		<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${mm.mstart}"/></td>
		<td>${mm.scNum}관</td>
		<td>${mm.seatNum}</td>
		<td>${mm.cost}</td>

	</tr>
</c:forEach>
</tbody>

</table>
<div class="center-block">
<nav>
  <ul class="pagination">
    <li>
      <a href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    
    <c:forEach var="i" begin="${startPage }" end="${endPage }">
	    <c:choose>
			<c:when test="${i==page }">
				<li class="active"><a href="#">${i }</a></li>
			</c:when>
			<c:otherwise>
				<li class=""><a href="resv?page=${i }">${i }</a></li>
			</c:otherwise>
		</c:choose>
    </c:forEach>
    <li>
      <a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>

</div>
</div>
