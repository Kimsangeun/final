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
			$(this).tab('show');
// 			$('.form-control').css({'width':'80%'});
// 			$('.tab-pane').css({'width':'70%'});
		});
		
	})
</script>

<style>
.tab-content {

	border: px solid;
	
}

.tab-pane {

	width : 70%;
	min-width : ;

}

.form-control {
	width : 80%;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<nav class="navbar navbar-default">
		<div>
			<ul class="nav navbar-nav nav-tabs">
				<li class="active"><a href="#id">아이디찾기</a></li>
				<li ><a href="#pw">비밀번호찾기</a></li>
			</ul>
		</div>
		</nav>
		<div class="tab-content" style="margin-top: 80px;">
			<div class="tab-pane fade active in" style="width : 70%;" id="id">
			<div style="margin: 5%"><h3>아이디찾기</h3></div>
			<hr>
			<form id="idSearch" action="/proj/idSearch" role="form" class="form-horizontal">
				<div style="width:; margin-left: 5%;">
				<div class="form-group">	
					<label for="id_name" class="col-sm-2 control-label">이름</label>
					<div class="col-sm-6"><input type="text" class="form-control" id="id_name" name="id_name" style="width : 80%;"></div>
				</div>
				<div class="form-group">	
					<label for="id_phone" class="col-sm-2 control-label">휴대전화</label>
					<div  class="col-sm-6"><input type="text" class="form-control" id="id_phone" name="id_phone" style="width : 80%;"></div>
				</div>
				<hr style=" margin-top: 5%;">
				<div>
					<div class="form-group" style="float: right; margin-right:43%"> 
					<button type="submit" class="btn btn-default">ID찾기</button>
					</div>
				</div>
				</div>		
			</form>
			</div>
			<div class="tab-pane fade  " style="width : 70%;" id="pw">
			<div style="margin: 5%"><h3>비밀번호찾기</h3></div>
			<hr>
			<form id="pwSearch" action="/proj/pwSearch" role="form" class="form-horizontal">
				<div style=" margin-left: 5%;">
				<div class="form-group">	
					<label for="pw_id" class="col-sm-2 control-label">아이디</label>
					<div class="col-sm-6"><input type="text" class="form-control" id="pw_id" name="pw_id" style="width : 80%;"></div>
				</div>
				<div class="form-group">	
					<label for="pw_name" class="col-sm-2 control-label">이름</label>
					<div class="col-sm-6"><input type="text" class="form-control" id="pw_name" name="pw_name" style="width : 80%;"></div>
				</div>
				<div class="form-group">	
					<label for="pw_phone" class="col-sm-2 control-label">휴대전화</label>
					<div  class="col-sm-6"><input type="text" class="form-control" id="pw_phone" name="pw_phone" style="width : 80%;"></div>
				</div>
				<hr style=" margin-top: 50px;">
				<div>
					<div class="form-group" style="float: right; margin-right:43%"> 
					<button type="submit" class="btn btn-default">PW찾기</button>
					</div>
				</div>
				</div>		
			</form>
			</div>		
		</div>
	</div>
</body>
</html>
