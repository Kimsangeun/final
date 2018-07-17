<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="http://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
</head>

<script>

</script>


<body>
<button type="button" class="btn btn-danger" onclick="location.href='insertMovieForm'">추가</button>
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
		<td><a href="detailMovie?mid=${mm.mid }">${mm.title}</a></td>
		<td>${mm.runtime}</td>
		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${mm.release}"/></td>
		<td><input type="button" value="X" onclick="location.href='deleteMovie?mid=${mm.mid}'"></td>
		<td>Modify</td>
		<%-- <td>${mm.mstart}</td> --%>
	</tr>
</c:forEach>
	<%-- <tr>
		
		<td colspan="4" align="right">영화명
		<select name="mID" id="selectDate" >
				<!-- <option value=""> 영화명 -->
				<c:forEach items="${data['movie']}" var="mm">
					<option value="${mm.mid }">${mm.title }
				</c:forEach>
		</select>상영관
		<select name="scNum" id="selectScreen" >
				<!-- <option value=""> 상영관 -->
				<c:forEach items="${data['screen']}" var="mm">
					<option value="${mm.scNum }">${mm.scNum }관
				</c:forEach>
		</select>	
		상영시간	
		<input type="text" class='timepicker' name="timeset" readonly>
		<form:errors path="timeVo.mID"/>
		<input type="hidden" value="${param.mstart eq null ? mindate : param.mstart}" name="mstart"/>
		<!-- <input class="timepicker" /> -->
		<input type="submit"/>
		
		</td>
	</tr>	 --%>
</tbody>
</table>
</body>
</html>