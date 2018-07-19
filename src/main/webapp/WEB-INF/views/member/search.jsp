<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/proj/resources/bootstrap-3.2.0-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/proj/resources/bootstrap-3.2.0-dist/css/bootstrap-theme.min.css">
<script type="text/javascript" src="/proj/resources/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/proj/resources/bootstrap-3.2.0-dist/js/bootstrap.min.js"></script>
<script>
	$(function() {
		$('ul.nav-tabs a').click(function(e) {
			e.preventDefault()
			$(this).tab('show')
		});
		
	})
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<nav class="navbar navbar-default">
		<div>
			<ul class="nav navbar-nav nav-tabs">
				<li class="active"><a href="#id">아이디찾기</a></li>
				<li><a href="#pw">비밀번호찾기</a></li>
			</ul>
		</div>
		</nav>
		<div class="tab-content" style="margin-top: 80px;">
			<div class="tab-pane fade active in" id="id">
			<h3>아이디찾기</h3>
			<form id="idSearch" action="/proj/idSearch">
				<table border="/proj/idSearch">
					<tr>
						<td>이름</td>
						<td><input type="text" id="id_name" name="id_name"></td>
					</tr>
					<tr>
						<td>휴대전화</td>
						<td><input type="text" placeholder="'-'없이 입력바랍니다." id="id_phone" name="id_phone"></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="submit" value="id찾기"></td>					
					</tr>
				</table>
			</form>
			</div>
			<div class="tab-pane fade" id="pw">
				<h3>비밀번호찾기</h3>
				<form id="pwSearch" action="/proj/pwSearch">
				<table border="">
					<tr>
						<td>아이디</td>
						<td><input type="text" id="pw_id" name="pw_id"></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" id="pw_name" name="pw_name"></td>
					</tr>
					<tr>
						<td>휴대전화</td>
						<td><input type="text" placeholder="'-'없이 입력바랍니다." id="pw_phone" name="pw_phone"></td>
					</tr>
					
					<tr>
						<td colspan="2" align="center"><input type="submit" value="pw찾기"></td>	
					</tr>
				</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
