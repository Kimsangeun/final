<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/proj/joinMember">
	<div class="frame">
		<!-- 아이디 -->
		<div class="each">
			<h3 class="each_title">아이디</h3>
			<span class="box_id"> <input type="text" id="id" name="id"
				class="int" title="ID" maxlength="14">
			</span> <span class="error_next_box" id="idMsg" style="display: none"></span>
		</div>

		<!-- 비밀번호 및 재확인 -->
		<div class="each">
			<h3 class="each_title">비밀번호</h3>
			<span class="box_pw"> <input type="password" id="pw"
				name="pw" class="int" title="비밀번호 입력" maxlength="14">
			</span> 
			<span class="error_next_box" id="pw1Msg" style="display: none">5~12자의 영문 소문자, 숫자와 특수기호(_)만 사용 가능합니다.</span>

			<h3 class="each_title">비밀번호 재확인</h3>
			<span class="box_pwChk"> <input type="password" id="pw2"
				name="pw2" class="int" title="비밀번호 재확인 입력" maxlength="14">
			</span> 
			<span class="error_next_box" id="pw2Msg" style="display: none"></span>
		</div>

		<!-- 이름 -->
		<div class="each">
			<h3 class="each_title">이름</h3>
			<span class="box_name"> <input type="text" id="name"
				name="name" class="int" title="이름" maxlength="40">
			</span> <span class="error_next_box" id="nameMsg" style="display: none"></span>
		</div>

		<!-- 생년월일 -->
		<div class="each birth">
			<h3 class="each_title">생년월일</h3>
			<div class="bir_wrap">
				<div class="bir_yy">
					<span class="ps_box"> <input type="text" id="yy" name="yy"
						placeholder="년(4자)" class="int" maxlength="4"> <label
						for="yy" class="lbl">년(4자)</label>
					</span>
				</div>
				<div class="bir_mm">
					<span class="ps_box"> <select id="mm" name="mm" title="월" class="sel">
							<option>월</option>
							<option value="01">1</option>
							<option value="02">2</option>
							<option value="03">3</option>
							<option value="04">4</option>
							<option value="05">5</option>
							<option value="06">6</option>
							<option value="07">7</option>
							<option value="08">8</option>
							<option value="09">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
					</select>
					</span><!--ㄴ  -->
				</div>
				<div class=" bir_dd">
					<span class="ps_box"> <input type="text" id="dd" name="dd"
						placeholder="일" class="int" maxlength="2"> <label for="dd"
						class="lbl">일</label>
					</span>
				</div>
			</div>
			<span class="error_next_box" id="birthMsg" style="display: none"></span>
		</div>
		
		
	<!-- 핸드폰 -->
		<div class="each">
			<h3 class="each_title">휴대폰</h3>
			<span class="box_phone"> <input type="text" id="phone"
				name="phone" class="int" title="휴대폰" maxlength="40">
			</span> <span class="error_next_box" id="phoneMsg" style="display: none"></span>
		</div>
        
    <!-- 이메일인증 -->
        <div class="each">
			<h3 class="each_title">이메일</h3>
			<span class="box_email"> <input type="text" id="email"
				name="email" class="int" title="이메일" maxlength="40">
			</span> <span class="error_next_box" id="emailMsg" style="display: none"></span>
		</div>
    
    <div><input type="submit"></div>
    
	</div>
	</form>
	
</body>
</html>