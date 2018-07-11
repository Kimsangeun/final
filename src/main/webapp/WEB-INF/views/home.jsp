<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
.S_temp {
	float: left;
}
</style>


<div>
	<jsp:include page="inc/hightop.jsp" />
</div>
<div>
	<jsp:include page="inc/top.jsp" />
</div>
<div class="S_temp" style="width: 150px;">
	<jsp:include page="inc/topmenu.jsp" />
</div>
<div class="S_temp">
	<c:choose>
		<c:when test="${main==null}">
			<jsp:include page="inc/contents.jsp" />
		</c:when>
		<c:when test="${main eq 'home' }">
			<jsp:include page="inc/contents.jsp" />
		</c:when>
		<c:otherwise>
			<jsp:include page="${menu }/${main }.jsp" />
		</c:otherwise>
	</c:choose>
</div>
<div style="clear: both"></div>
<jsp:include page="inc/bottom.jsp" />

</html>