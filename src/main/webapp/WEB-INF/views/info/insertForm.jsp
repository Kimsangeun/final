<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>

</style>

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

<form action="insertReg" method="post" enctype="multipart/form-data"
	accept-charset="UTF-8">
	<table class="table table-hover" align="center" style="width:60%;">
		<tr>
			<td ><b>작성자</b></td>
			<td colspan="3" align="center">${mem.id }</td>
		</tr>
		<tr>
			<td><b>제목</b></td>
			<td colspan="3" style="width:70%"><input type="text" style="width:90%;"  name="title"/></td> 
			
		</tr>
		<c:choose>
			<c:when test="${param.kind eq 'qna' }">			
			
			</c:when>
			<c:otherwise>
			<tr>
				<td><b>파일</b></td>
				<td colspan="3"><input type="file" name="mmfile" value=""/></td>
			</tr>
			</c:otherwise>
		</c:choose>
		<tr>
			<td><b>내용</b></td>
			<td colspan="3"><textarea style="width: 90%;resize:none" rows="5"  name="content" ></textarea></td>
		</tr>
		<tr>
			<td colspan="4" align="center"  ><input type="submit" value="작성">
			<a href="${param.kind }" >뒤로</a></td>
		</tr>
	</table>
</form>