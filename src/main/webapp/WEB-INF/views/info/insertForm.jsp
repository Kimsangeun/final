<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<form action="insertReg" method="post" enctype="multipart/form-data"
	accept-charset="UTF-8">
	<table class="table table-hover">
		<tr>
			<td>작성자</td>
			<td colspan="3" align="center">${mem.id }</td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input type="text" name="title"/></td>
			
		</tr>
		<c:choose>
			<c:when test="${param.kind eq 'qna' }">			
			
			</c:when>
			<c:otherwise>
			<tr>
				<td>파일</td>
				<td colspan="3"><input type="file" name="mmfile" value=""/></td>
			</tr>
			</c:otherwise>
		</c:choose>
		<tr>
			<td>내용</td>
			<td colspan="3"><textarea rows="5" cols="20" name="content"></textarea></td>
		</tr>
		<tr>
			<td colspan="4" align="center" ><input type="submit" value="작성">
			<a href="${param.kind }" >뒤로</a></td>
		</tr>
	</table>
</form>