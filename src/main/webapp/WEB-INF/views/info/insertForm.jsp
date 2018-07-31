<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>

</style>

<script>

function gogo(){
	
	if($('#inmain').is(':checked') == true){
		$('#pw').val(1);
	}
	else{
		$('#pw').val(0);
	}
	if($('#tt').val() == ''){
		
		alert('제목을 입력하세요');
		return;
	}
	else if($('#ct').val() == ''){
		
		alert('내용을 입력하세요');
		return;
	}
	
 	document.insfrm.submit(); 
}
</script>

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
	accept-charset="UTF-8" name="insfrm">
	<input type="hidden" name="pw" id="pw"/>
	<table class="table table-hover" align="center" style="width:60%;">
		<tr>
			<td ><b>작성자</b></td>
<%-- 			<c:choose>
			<c:when test="${param.kind != 'notice'}"> --%>
			<td colspan="3" align="center">${mem.id }</td>
			
<%-- 			</c:when>
			<c:otherwise>
			<td align="center">${mem.id }</td>
			<td ><b>메인화면</b></td>
			<td align="center"><input type="checkbox" name="inmain" id="inmain"></td>
			
			</c:otherwise>
			</c:choose> --%>
		</tr>
		<tr>
			<td><b>제목</b></td>
			<td colspan="3" style="width:70%"><input type="text" style="width:90%;"  name="title" id="tt"/></td> 
			
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
			<td colspan="3"><textarea style="width: 90%;resize:none" rows="5"  name="content" id="ct"></textarea></td>
		</tr>
		<tr>
			<td colspan="4" align="center"><a style="cursor: pointer" onclick="gogo()">작성</a>
			<a href="${param.kind }" >뒤로</a></td>
		</tr>
	</table>
</form>