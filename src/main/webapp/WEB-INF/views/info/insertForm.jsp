<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<form action="insertReg" method="post" enctype="multipart/form-data"
	accept-charset="UTF-8">
<%-- 	<input type="hidden" name="kind" value="${kind }"> --%>
	<table border="">
		<tr>
			<td>작성자</td>
			<td colspan="3"><input type="text" name="pid" value="${mem.id }"/></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input type="text" name="title"/></td>
			
			<td>비밀번호</td>
			<td><input type="password" name="pw" /></td>
		</tr>
		<tr>
			<td>파일</td>
			<td colspan="3"><input type="file" name="mmfile" value=""/></td>
		</tr>
		<tr>
			<td colspan="4"><textarea rows="5" cols="20" name="content"></textarea></td>
		</tr>
		<tr>
			<td colspan="4" align="center" ><input type="submit" value="작성">
			<a href="" >뒤로</a></td>
		</tr>
	</table>
</form>