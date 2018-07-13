<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	function modifyForm(){
		
	}
	
	function withdrawal(){
		if(confirm('정말탈퇴하'))
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div id="frame">
	
		<div class="each_frame">
			<div class="info">ID</div>
			<div class="content"><input type="text" value="${data.id}" readonly></div>
		</div>
		
		<div class="each_frame">
			<div class="info">이름</div>
			<div class="content">
			<input type="text" value="${data.name}" readonly>
			</div>
		</div>
		
		<div class="each_frame">
			<div class="info">핸드폰</div>
			<div class="content"><input type="text" value="${data.phone}" readonly></div>
		</div>
		
		<div class="each_frame">
			<div class="info">생일</div>
			<div class="content"><input type="text" value="${data.birth}" readonly></div>
		</div>
		
		<div class="each_frame">
			<div class="info">e-mail</div>
			<div class="content"><input type="text" value="${data.birth}" readonly></div>
		</div>
		
		<div class="each_frame">
			<div class="info">비밀번호</div>
			<div class="content"><span class="pw">
			<input type="password" name="pw" placeholder="회원 수정/탈퇴를 위해서는 비밀번호 입력이 필수입니다.">
			</div>
		</div>
		
		<div class="each_frame">
			<div class="button_modify">
			<input name = "modify" type="button" value="회원수정" onclick="modifyForm()">
			</div>
			<div class="button_withdrawal">
			<input name="withdrawal" type="button" value="회원탈퇴" onclick="withdrawal()">
			</div>
		</div>
	</div>
	
</body>
</html>