<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ct" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<div>
	<h2>
	<c:choose>
	
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

<table class="table table-hover" align="center" style="width:60%">
	<tr>
		<td><b>작성자</b></td>
		<td>${data.pid }</td>
		<td><b>작성일</b></td>
		<td>${data.regdateStr }</td>
	</tr>
	<tr>
		<td><b>제목</b></td>
		<c:choose>
			<c:when test="${data.kind eq 'qna'}">
				<td colspan="3">${data.title }</td>
			</c:when>
			<c:otherwise>
				<td>${data.title }</td>
				<td><b>조회수</b></td>
				<td>${data.cnt }</td>
			</c:otherwise>
		</c:choose>
	</tr>
	<c:choose>
		<c:when test="${data.kind eq 'qna'}">
		</c:when>
		<c:otherwise>
			<c:if test="${data.upfile != null}">
				<tr>
					<td><b>파일</b></td>
					<td colspan="3">${data.upfile }</td>
				</tr>
			</c:if>
		</c:otherwise>
	</c:choose>


	<c:if test="${data.img && data.upfile!=null}">
		<tr>
			<td colspan="4"><img class="img-responsive"
				src="${pageContext.request.contextPath}\resources\board/${data.upfile}" />
			</td>
		</tr>
	</c:if>
	<tr>
		<td colspan="4"><ct:conBr>${data.content }</ct:conBr></td>
	</tr>
	<tr>
		<td colspan="4" align="right"><a href="${data.kind }">뒤로가기</a> <c:choose>
				<c:when test="${mem.id=='admin'}">
					<c:choose>
						<c:when test="${data.kind == 'qna' }">
							<a href="replyForm?bid=${data.bid }">답변하기</a>
						</c:when>
						<c:otherwise>
							<a href="modify?bid=${data.bid }">수정하기</a>
							<a href="delete?bid=${data.bid }">삭제하기</a>
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>
					<c:if test="${data.kind == 'qna' }">
						<a href="delete?bid=${data.bid }">삭제하기</a>
					</c:if>
				</c:otherwise>
			</c:choose></td>
	</tr>
</table>