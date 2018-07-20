<%@page import="com.jhta.proj.model.BoardVO"%>
<%@page import="com.jhta.proj.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<form action="modifyReg" method="post" enctype="multipart/form-data"
	accept-charset="UTF-8">
	<input type="hidden" name="bid" value="${data.bid}">

	<table class="table table-hover">
		<tr>
			<td>작성자</td>
			<td colspan="3"><input type="text" name="pid"
				value="${data.pid }" /></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input type="text" name="title" value="${data.title }" /></td>
		</tr>
		<tr>
			<td>파일</td>
			<td colspan="3"><input type="file" name="mmfile"
				value="${data.mmfile }" /></td>
		</tr>
		
		<tr>
			<td colspan="4"><textarea rows="5" cols="20" name="content">${data.content }</textarea></td>
		</tr>
		<tr>
			<td colspan="4" align="center"><input type="submit" value="작성">
				<a href="${data.kind}">뒤로</a></td>
		</tr>
	</table>
</form>