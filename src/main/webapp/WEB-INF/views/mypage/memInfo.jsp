<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript">

	$(function(){
		$('#modBtn').on('click', function(){
			
			var data = {
					id : $('#id').text(),
					pw : $('#pw').val(),
					newpw : $('#newpw').val(),
					newpwChk : $('#newpwChk').val(),
					name : $('#name').val(),
					phone : $('#phone').val(),
					birth : $('#birth').val(),
					email : $('#email').val()
					
			}
			
			$.ajax({
				url: "/proj/ajax/modify",
 				dataType : 'json',
				data : data,
				type : 'POST',
				success: function(result){
					alert(result.msg);
					
				}
			
			});
		})
		
		$('#withBtn').on('click', function(){
			
			var data = {
					id : $('#id').text(),
					pw : $('#pw').val()
					
			}
			
			$.ajax({
				url: "/proj/ajax/withdrawal",
				dataType : 'json',
				data : data,
				type : 'POST',
				success: function(result){
					alert(result.msg);
					
				}
			
			});
		})
	})
	
	
	
	
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div id="frame">
	
		<div class="each_frame">
			<div class="info">ID</div>
			<div class="content" id="id">${data.id}</div>
		</div>
		
		<div class="each_frame">
			<div class="info">비밀번호</div>
			<div class="content" ><span class="pw">
			<input type="password" id="pw" name="pw" placeholder="회원 수정/탈퇴를 위해서는 비밀번호 입력이 필수입니다.">
			</div>
		</div>
		
		<div class="each_frame">
			<div class="info">새 비밀번호</div>
			<div class="content"><span class="newpw">
			<input type="password" id="newpw" name="newpw">
			</div>
		</div>
		
		<div class="each_frame">
			<div class="info">새 비밀번호 확인</div>
			<div class="content"><span class="newpwChk">
			<input type="password" id="newpwChk" name="newpwChk" >
			</div>
		</div>
		
		<div class="each_frame">
			<div class="info">이름</div>
			<div class="content">
			<input type="text" id="name" value="${data.name}" readonly>
			</div>
		</div>
		
		<div class="each_frame">
			<div class="info">핸드폰</div>
			<div class="content"><input type="text" id="phone" value="${data.phone}"></div>
		</div>
		
		<div class="each_frame">
			<div class="info">생일</div>
			<div class="content"><input type="text" id="birth" value="${data.birth}" readonly></div>
		</div>
		
		<div class="each_frame">
			<div class="info">e-mail</div>
			<div class="content"><input type="text" id="email" value="${data.email}" readonly></div>
		</div>
		
		
		
		<div class="each_frame">
			<div class="button_modify">
			<input name = "modify" id="modBtn" type="button" value="회원수정" />
			</div>
			<div class="button_withdrawal">
			<input name="withdrawal" id="withBtn" type="button" value="회원탈퇴" onclick="withdrawal()"/>
			</div>
		</div>
	</div>
	
</body>
</html>