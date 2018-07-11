<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"content="width=device-width, initial-scale=1.0 , 
user-scalable=0, minimum-scale=1.0, maximum-scale=1.0"/>


<link rel="stylesheet" href="../resources/bootstrap-3.2.0-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/bootstrap-3.2.0-dist/css/bootstrap-theme.min.css">

<script type="text/javascript" src="../resources/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../resources/bootstrap-3.2.0-dist/js/bootstrap.min.js"></script>

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
<c:if test="${menu != 'menu' }">
<jsp:include page="${menu }/topmenu.jsp" />
</c:if>
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