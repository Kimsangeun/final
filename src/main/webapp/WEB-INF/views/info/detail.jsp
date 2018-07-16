<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

	<table border="">
		<tr>
			<td>작성자</td>
			<td>${data.pid }</td>
			<td>작성일</td>
			<td>${data.regdate }</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${data.title }</td>
			<td>조회수</td>
			<td>${data.pid }</td>
		</tr>
		<tr>
			<td>파일</td>
			<td colspan="3">${data.upfile }</td>
		</tr>
		<tr>
			<td colspan="4">${data.content }</td>
		</tr>
		<tr>
			<td colspan="4" align="right">
			<a href="${data.kind }">뒤로가기</a> 
			<a href="modify?bid=${data.bid }">수정하기</a> 
			<a href="delete?bid=${data.bid }">삭제하기</a> 
			</td>
		</tr>
	</table>