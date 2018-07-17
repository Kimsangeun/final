<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<form>
	<table border="">
		<tr>
			<td>제목</td>
			<td><input type="text" name="title" value="${data.title }"/></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><input type="text" name="pid" /></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="text" name="pw" /></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea name="content" rows="5" cols="30">${data.content }</textarea></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="작성" /> <a
				href="detail?bid=${data.bid}">뒤로</a></td>
		</tr>
	</table>
</form>
