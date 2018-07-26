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
<div class="page-header">
  <h1>회원 목록<small></small></h1>
</div>

<div class="container">
<table class="table table-hover" >

	<thead>
	<tr>
		<th>번호</th>
		<th>ID</th>
		<th>이름</th>
		<th>E-mail</th>
		<th>휴대폰</th>
		<th>상태</th>
		<!-- <td>삭제</td>
		<td>변경</td> -->
		<!-- <td>날짜</td> -->
	</tr>	
	</thead>
	<tbody>
<c:forEach items="${data }" var="mm" varStatus="no">
	<tr>
		<td>${no.index }</td>
		<td>${mm.id}</td>
		<td>${mm.name}</td>
		<td>${mm.email}</td>
		<td>${mm.phone}</td>
		<td>${mm.out eq 0 ? '정상' : '탈퇴'}</td>
		<%-- <td><fmt:formatDate pattern="yyyy-MM-dd" value="${mm.birth}"/></td> --%>
		<%-- <td><input type="button" value="X" onclick="location.href='deleteMovie?mid=${mm.mid}'"></td>
		<td>Modify</td> --%>
		<%-- <td>${mm.mstart}</td> --%>
	</tr>
</c:forEach>
</tbody>
</table>
<div class="center-block">
<nav>
  <ul class="pagination">
     <c:if test="${startPage >1 }">
	<li><a href="member?page=1" aria-label="Previous"><span aria-hidden="true">[처음]</span></a></li>
	<li>
      <a href="member?page=${startPage-1 }" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
	</c:if>
    
    <c:forEach var="i" begin="${startPage }" end="${endPage }">
	    <c:choose>
			<c:when test="${i==page }">
				<li class="active"><a href="#">${i }</a></li>
			</c:when>
			<c:otherwise>
				<li class=""><a href="member?page=${i }">${i }</a></li>
			</c:otherwise>
		</c:choose>
    </c:forEach>
    <c:if test="${endPage<totalPage}">
    <li>
      <a href="member?page=${endPage+1 }" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
    <li>
      <a href="member?page=${totalPage }" aria-label="Next">
        <span aria-hidden="true">마지막</span>
      </a>
    </li>
    </c:if>
  </ul>
</nav>

</div>
</div>
