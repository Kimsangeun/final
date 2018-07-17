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
</head>
<style>

</style>
<script>

</script>


<body>

<%-- <table class="mainPage" border="" >

<c:forEach items="${mainpagemov}" var="mm" varStatus="no">
	<tr>
		<td><img class="mainImg" src="${pageContext.request.contextPath}\resources\movposter/${mm.poster}" /></td>
		<td>${mm.title}</td>
		
	</tr>
</c:forEach>
	
</table> --%>
<div class="mainPage" >

<c:forEach items="${mainpagemov}" var="mm" varStatus="no">
	<div class="mainMovie">
		<div><img class="mainImg" src="${pageContext.request.contextPath}\resources\movposter/${mm.poster}" /></div>
		<div>${mm.title}</div>
	</div>
</c:forEach>
	
</div>
</body>
</html>