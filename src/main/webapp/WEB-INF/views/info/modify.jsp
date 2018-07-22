<%@page import="com.jhta.proj.model.BoardVO"%>
<%@page import="com.jhta.proj.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div>
	<h2>	<c:choose>
	
	<c:when test="${data.kind == 'notice'}">
	공지사항
	</c:when>
	<c:when test="${data.kind == 'faq'}">
	FAQ
	</c:when>
	<c:when test="${data.kind == 'qna'}">
	QNA
	</c:when>
	
	</c:choose>
</h2>
</div>
<hr>

<form action="modifyReg" method="post" enctype="multipart/form-data"
	accept-charset="UTF-8">
	<input type="hidden" name="bid" value="${data.bid}">

	<table class="table table-hover" align="center" style="width:60%;">
		<tr>
			<td><b>작성자</b></td>
			<td colspan="3"><input type="text" name="pid"
				value="${data.pid }"  style="width:90%;"  /></td>
		</tr>
		<tr>
			<td><b>제목</b></td>
			<td><input type="text" name="title" value="${data.title }" style="width:90%;"  /></td>
		</tr>
		<tr>
			<td><b>파일</b></td>
			<td colspan="3"><input type="file" name="mmfile"
				value="${data.mmfile }" /></td>
		</tr>
		
		<tr>
			<td colspan="4"><textarea style="width:90%;resize:none"rows="5" name="content">${data.content }</textarea></td>
		</tr>
		<tr>
			<td colspan="4" align="center"><input type="submit" value="작성">
				<a href="${data.kind}">뒤로</a></td>
		</tr>
	</table>
</form>