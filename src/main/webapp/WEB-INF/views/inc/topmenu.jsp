<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
.S_side{
margin-left: 20px;
}
</style>
<div class="S_side">menu</div>

<c:forEach items="${side }" var="ss">
<div class="S_side">
<a href="${ss}">${ss}</a>
</div>
</c:forEach>