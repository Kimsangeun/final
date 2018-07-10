<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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

$(document).ready(function(){
    $('input.timepicker').timepicker({});
});

$('.timepicker').timepicker({
    timeFormat: 'h:mm p',
    interval: 30,
    minTime: '10',
    maxTime: '6:00pm',
    defaultTime: '11',
    startTime: '10:00',
    dynamic: false,
    dropdown: true,
    scrollbar: true
});
</script>


<body>
<form action="?">
	<input type="date" name="mstart" value="${param.mstart}" onchange="submit()" /> 날짜
</form>	
<form action="time" method="POST">
<table border="" >

	<%-- <tr>
		
		<td colspan="5" align="center">
			<select name="selectDate" id="selectDate" >
				<option value=""> 영화명
				<c:forEach items="${data['movie']}" var="mm">
					<option value="${mm.mid }">${mm.title }
				</c:forEach>
			</select>	
			
		</td>
	</tr>
	<tr>
		
		<td colspan="5" align="center">
			<select name="selectScreen" id="selectScreen" >
				<option value=""> 상영관
				<c:forEach items="${data['screen']}" var="mm">
					<option value="${mm.scNum }">${mm.scNum }관
				</c:forEach>
			</select>	
			
		</td>
	</tr> --%>
	<tr>
	
	</tr>
	
	
	<tr>
		<td>번호</td>
		<td>상영시간</td>
		<td>상영관</td>
		<td>제목</td>
		<td>날짜</td>
	</tr>	

<c:forEach items="${data['time'] }" var="mm" varStatus="no">
	<tr>
		<td>${mm.sID}</td>
		<td><fmt:formatDate type="time" value="${mm.mstart}"/></td>
		<td>${mm.scNum}</td>
		<td>${mm.mID}</td>
		<td>${mm.mstart}</td>
	</tr>
</c:forEach>
	<tr>
		
		<td colspan="4" align="right">
		<select name="mID" id="selectDate" >
				<option value=""> 영화명
				<c:forEach items="${data['movie']}" var="mm">
					<option value="${mm.mid }">${mm.title }
				</c:forEach>
		</select>
		<select name="scNum" id="selectScreen" >
				<option value=""> 상영관
				<c:forEach items="${data['screen']}" var="mm">
					<option value="${mm.scNum }">${mm.scNum }관
				</c:forEach>
		</select>		
		<input type="text" class='timepicker' readonly>
		<input type="hidden" value="${param.mstart}" name="mstart"/>
		<!-- <input class="timepicker" /> -->
		<input type="submit"/>
		
		</td>
	</tr>	

</table>
</form>
</body>
</html>