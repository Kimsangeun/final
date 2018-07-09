<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<style>
a{
color: black;
text-decoration: none;
text-align: left;
}

.S_top{
float: left;
padding : 15px 0;
margin: 0 10%;
}
</style>


<body>
<c:forEach items="${top }" var="tt">
<div class="S_top">
<c:choose>
<c:when test="${menu eq 'menu' }">
<a href="${tt}/">${tt}</a>
</c:when>
<c:otherwise>
<a href="../${tt}/">${tt}</a>
</c:otherwise>
</c:choose>
</div>
</c:forEach>
<div style="clear: both;"></div>

</body>
</html>