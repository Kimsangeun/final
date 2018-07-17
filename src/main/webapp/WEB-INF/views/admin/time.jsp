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

$(document).ready(function(){
    $('input.timepicker').timepicker({
    	
    	 timeFormat: 'HH:mm',
    	    interval: 30,
    	    defaultTime: '9',
    	    startTime: '00:00',
    	    dynamic: false,
    	    dropdown: true,
    	    scrollbar: true
    });
    $('#datetimepicker').data("DateTimePicker").FUNCTION()
/*     $(".datepico").change(function(){
      if($.trim($(".datepico").val())==''){
        alert("날짜를 입력해주세요.");
        return false;
      }  
      $(".datepico").submit();
    });  */
});




</script>


<body>
<fmt:formatDate var="mindate" value="<%= new Date() %>" pattern="yyyy-MM-dd"/>
<fmt:formatDate var="maxdate" value="<%= new Date(new Date().getTime() + 20*60*60*24*1000) %>" pattern="yyyy-MM-dd"/>
<form action="?">
<div class="form-group">
<!-- 	<input size="16" type="text" value="2012-06-15 14:45" readonly class="form_datetime">
 
<script type="text/javascript">
    $(".form_datetime").datetimepicker();
</script>        -->
	<input type="date" id="tpick" class="form_datetime" name="mstart" min="${mindate }" max="${maxdate }" 
	value="${param.mstart eq null ? mindate : param.mstart}" onchange="submit()" /> 
	<label for="tpick">날짜</label>
	</div>
</form>	
<p class="h1">${param.mstart eq null ? mindate : param.mstart}<p>	

<table class="table" >

	
	<tr>
		<td>번호</td>
		<td>상영관</td>
		<td>상영시간</td>
		<td>제목</td>
		<!-- <td>날짜</td> -->
	</tr>	

<c:forEach items="${data['time'] }" var="mm" varStatus="no">
	<tr>
		<td>${mm.sID}</td>
		<td>${mm.scNum}</td>
		<td><fmt:formatDate pattern="HH:mm" value="${mm.mstart}"/></td>
		<td>${mm.title}</td>
		<%-- <td>${mm.mstart}</td> --%>
	</tr>
</c:forEach>
</table>
<form class="form-inline" action="insert" method="POST">
		<div class="form-group">
		<label for="moive">영화명</label>
		<select id="moive" class="form-control " name="mID" id="selectDate" >
				<!-- <option value=""> 영화명 -->
				<c:forEach items="${data['movie']}" var="mm">
					<option value="${mm.mid }">${mm.title }
				</c:forEach>
		</select>
		</div>
		<div class="form-group">
		<label for="screen">상영관</label>
		<select id="screen" class="form-control" name="scNum" id="selectScreen" >
				<!-- <option value=""> 상영관 -->
				<c:forEach items="${data['screen']}" var="mm">
					<option value="${mm.scNum }">${mm.scNum }관
				</c:forEach>
		</select>
		</div>
		<div class="form-group">	
		<label for="time">상영시간</label>	
		<input id="time" type="text" class='form-control timepicker' name="timeset" readonly>
		<form:errors path="timeVo.mID"/>
		<input type="hidden" value="${param.mstart eq null ? mindate : param.mstart}" name="mstart"/>
		<!-- <input class="timepicker" /> -->
		<input  class="btn btn-primary" value="시간표 추가" type="submit"/>
		</div>

</form>
</body>
</html>