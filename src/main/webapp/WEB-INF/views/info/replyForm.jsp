<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div>
	<h2>답변하기</h2>
</div>
<hr>
<form action="replyReg" method="post">
	<input type="hidden" value="${data.bid }" name="bid">
	<table class="table table-hover" align="center" style="width:60%;">
		<tr>
			<td><b>제목</b></td>
			<td><input type="text" name="title" value="[답변] ${data.title }" style="width:90%;" /></td>
		</tr>
		<tr>
			<td><b>작성자</b></td>
			<td><input type="text" name="pid" value="${mem.id }" style="width:90%;"  /></td>
		</tr>
		<tr>
			<td><b>내용</b></td>
			<td><textarea name="content" rows="5"  style="width:90%;resize:none" >${data.content }
			______________________
</textarea></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="작성" /> <a href="detail?bid=${data.bid}">뒤로</a></td>
		</tr>
	</table>
</form>
