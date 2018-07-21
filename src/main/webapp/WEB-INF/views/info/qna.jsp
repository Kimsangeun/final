<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div>
	<h2>QNA</h2>
</div>
<hr>

	<table class="table table-hover">

		<form action="?">
			<tr>
			<c:choose>
			<c:when test="${kind eq 'qna'}">
				<td colspan="4" align="center">검색 <select name="schCol">	
			</c:when>
			<c:otherwise>
				<td colspan="5" align="center">검색 <select name="schCol">
			</c:otherwise>
			</c:choose>
				
						<option value="title">제목</option>
						<option value="pid">작성자</option>
						<option value="content">내용</option>
						<c:choose>
						<c:when test="${kind eq 'qna'}">	
						</c:when>
						<c:otherwise>
							<option value="cnt">조회수</option>
						</c:otherwise>
						</c:choose>
						
				</select> <input type="text" name="title" /><input type="submit" value="검색" />
				</td>
			</tr>
		</form>

		<tr>
			<td><b>번호</b></td>
			<td><b>제목</b></td>
			<td><b>작성자</b></td>
			<td><b>작성일</b></td>
			<c:choose>
			<c:when test="${kind eq 'qna'}">	
			</c:when>
			<c:otherwise>
				<td><b>조회수</b></td>
			</c:otherwise>
			</c:choose>
		</tr>

		<c:forEach items="${data }" var="row" varStatus="no">
			<tr>
				<td>${total-(no.index + ((page-1)*10))}</td>
				<td><a href="detail?bid=${row.bid }">${row.title}</a></td>
				<td>${row.pid}</td>
				<td>${row.regdateStr}</td>
				<c:choose>
				<c:when test="${kind eq 'qna'}">	
				</c:when>
				<c:otherwise>
					<td>${row.cnt}</td>
				</c:otherwise>
				</c:choose>	
			</tr>
		</c:forEach>
		<tr>
			<c:choose>
			<c:when test="${kind eq 'qna'}">
				<td colspan="4" align="right"><a href="insertForm?kind=${kind }">글쓰기</a></td>	
			</c:when>
			<c:otherwise>
				<td colspan="5" align="right"><a href="insertForm?kind=${kind }">글쓰기</a></td>
			</c:otherwise>
			</c:choose>
		</tr>
	</table>
<c:if test="${startPage >1 }">
	<a href="${kind }?page=1&schCol=${param.schCol }&title=${param.title}"">[처음]</a>
	<a href="${kind }?page=${startPage-1 }&schCol=${param.schCol }&title=${param.title}""><</a>
</c:if>
<div align="center">
<c:forEach var="i" begin="${startPage }" end="${endPage }">
	<c:choose>
		<c:when test="${i==page }">
				[${i }]
			</c:when>
		<c:otherwise>
			<a href="${kind }?page=${i }&schCol=${param.schCol }&title=${param.title}"">${i }</a>
		</c:otherwise>
	</c:choose>
</c:forEach>
<c:if test="${endPage<totalPage }">
	<a href="${kind }?page=${endPage+1 }&schCol=${param.schCol }&title=${param.title}"">></a>
	<a href="${kind }?page=${totalPage }&schCol=${param.schCol }&title=${param.title}"">[마지막]</a>
</c:if>
	</div>