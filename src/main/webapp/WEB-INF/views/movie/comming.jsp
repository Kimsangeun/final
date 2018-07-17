<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:forEach items="${moviedata}" var="dd" varStatus="no">
		<img src="${pageContext.request.contextPath}\resources\movposter/${dd.poster}" />
		${dd.title }
</c:forEach> --%>

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

<script>

</script>


<body>

<table border="" >
<jsp:useBean id="now" class="java.util.Date" />
<fmt:parseNumber
value="${(now.time - now.time) / (1000*60*60*24) }"
integerOnly="true" /> 일 지남.

<c:forEach items="${moviedata}" var="mm" varStatus="no">

<fmt:formatDate value="${mm.release}" var="date" pattern="yyyy-MM-dd" /> 
 
	<tr>
		<td><a href="detailMovie?mid=${mm.mid }">
		<img src="${pageContext.request.contextPath}\resources\movposter/${mm.poster}" /></a>
		</td>
		<td>${mm.title}</td>
		<td>개봉일 ${date}</td>
		<td>d-<fmt:parseNumber value="${(mm.release.time - now.time)  / (1000*60*60*24)+1}"
integerOnly="true" /> </td>
	</tr>
</c:forEach>
	
</table>
</body>
</html>