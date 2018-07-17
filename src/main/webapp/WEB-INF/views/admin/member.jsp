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
<script type="text/javascript" src="../resources/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../resources/bootstrap-3.2.0-dist/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="http://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
</head>

<script>

</script>


<body>
<input type="button" value="추가" onclick="location.href='insertMovieForm'">
<table border="" >

	<tr>
	
	</tr>
	
	
	<tr>
		<td>번호</td>
		<td>ID</td>
		<td>이름</td>
		<td>E-mail</td>
		<td>상태</td>
		<!-- <td>삭제</td>
		<td>변경</td> -->
		<!-- <td>날짜</td> -->
	</tr>	

<c:forEach items="${data }" var="mm" varStatus="no">
	<tr>
		<td>${no.index }</td>
		<td>${mm.id}</td>
		<td>${mm.name}</td>
		<td>${mm.email}</td>
		<td>${mm.out eq 0 ? '정상' : '탈퇴'}</td>
		<%-- <td><fmt:formatDate pattern="yyyy-MM-dd" value="${mm.birth}"/></td> --%>
		<%-- <td><input type="button" value="X" onclick="location.href='deleteMovie?mid=${mm.mid}'"></td>
		<td>Modify</td> --%>
		<%-- <td>${mm.mstart}</td> --%>
	</tr>
</c:forEach>

</table>
</body>
</html>