<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ct" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<table class="table table-hover">
	<tr>
		<td>작성자</td>
		<td>${data.pid }</td>
		<td>작성일</td>
		<td>${data.regdateStr }</td>
	</tr>
	<tr>
		<td>제목</td>
		<td>${data.title }</td>
		<td>조회수</td>
		<td>${data.cnt }</td>
	</tr>
	<tr>
		<td>파일</td>
		<td colspan="3">${data.upfile }</td>
	</tr>
	<c:if test="${data.img}">
		<tr>
			<td colspan="4"><img class="img-responsive"
			 src="${pageContext.request.contextPath}\resources\board/${data.upfile}" />
			</td>
		</tr>
	</c:if>
	<tr>
		<td colspan="4"><ct:conBr >${data.content }</ct:conBr></td>
	</tr>
	<tr>
		<td colspan="4" align="right"><a href="${data.kind }">뒤로가기</a> <c:if
				test="${mem.id=='admin'}">
				<c:choose>
					<c:when test="${data.kind == 'qna' }">
						<a href="replyForm?bid=${data.bid }">답변하기</a>
					</c:when>
					<c:otherwise>
						<a href="modify?bid=${data.bid }">수정하기</a>
						<a href="delete?bid=${data.bid }">삭제하기</a>
					</c:otherwise>
				</c:choose>
			</c:if></td>
	</tr>
</table>