<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
<<<<<<< HEAD
.form-control{
	float : left;
	width : 50px;
=======
.form-control {
	float: left;
>>>>>>> branch 'master' of https://github.com/Kimsangeun/final.git
}

.S_s {
	float: left;
	margin: 0 8px;
	margin-top: 8px;
}

.S_s1 {
	float: left;
	margin: 0 8px;
	margin-right: 10%;
}
</style>

<script type="text/javascript">

	function aaaaa(v) {
		// 라디오 버튼 value 값 조건 비교
		if (v == "crd") {
			$('#cashview').css('display','none');
			$('#cardview').css('display','');
		} else {
			$('#cashview').css('display','');
			$('#cardview').css('display','none');	
		}
	}

	function numkeyCheck(e) {
		var keyValue = event.keyCode;
		if( ((keyValue >= 48) && (keyValue <= 57)) )
			return true;
		else
			return false;
	}
	
	function goPay(){

		var totalnum = $("#cardnum1").val().length+ $("#cardnum2").val().length+$("#cardnum3").val().length+$("#cardnum4").val().length;
		
		if(totalnum!=16){
			alert('카드 번호를 확인하세요.');
			return;
		}
		if($("#cardpw").val().length!=2){
			alert('비밀 번호를 확인하세요.');
			return;
		}
		document.pendfrm.submit();
	}
	
</script>

<div>
	<div>
		<h2>결제하기</h2>
	</div>

	<hr>

<<<<<<< HEAD
	<div style="width: 100%;  float: left">
		<form action="/proj/reservation/payend" method="post" id="pendfrm">
			<div style="margin: 0 20px; float : left;">
			<input type="radio" name="paytype" value="csh" id="cash"
				onclick="div_OnOff(this.value,'cashview')"> 계좌이체 </div>
=======
	<div style="width: 300px; float: left">
		<form action="/proj/reservation/payend" method="post" id="pendfrm" name="pendfrm">
			<div style="margin: 0 20px; float: left;">
			계좌이체
				<input type="radio" name="paytype" value="csh" id="cash"
					onclick="aaaaa('csh')" >
			</div>
>>>>>>> branch 'master' of https://github.com/Kimsangeun/final.git
			<div>
<<<<<<< HEAD
			<input
				type="radio" name="paytype" value="crd" id="card"
				onclick="div_OnOff(this.value,'cardview')"> 카드결제 </div>
			
			<div style="clear : both;"></div>
=======
			카드결제
				<input type="radio" name="paytype" value="crd" id="card"
					onclick="aaaaa('crd')" >
			</div>
>>>>>>> branch 'master' of https://github.com/Kimsangeun/final.git

<<<<<<< HEAD
=======

>>>>>>> branch 'master' of https://github.com/Kimsangeun/final.git
			<hr>

			<!-- 계좌이체 디브 -->

			<div id="cashview" style="display: none">
				<div class="S_s1">계좌번호</div>
<<<<<<< HEAD
				<input type="text" class="form-control" name="banknum" style="width : 200px;">
				
				<div style="clear: both;"></div><hr>
					
=======
				<input type="text" class="form-control" name="banknum">

				<div style="clear: both;"></div>
				<hr>

>>>>>>> branch 'master' of https://github.com/Kimsangeun/final.git
				<div class="S_s1">비밀번호</div>
<<<<<<< HEAD
				<input type="text" class="form-control" name="bankpw"  style="width : 200px;"> 
				
				<div style="clear: both;"></div><hr>
					
=======
				<input type="text" class="form-control" name="bankpw">

				<div style="clear: both;"></div>
				<hr>

>>>>>>> branch 'master' of https://github.com/Kimsangeun/final.git
				<div class="S_s1">보낼 계좌</div>
<<<<<<< HEAD
				<div  class="form-control" name="sendbank"  style="width : 200px;">신한 000-00-000000</div>
				
				<div style="clear: both;"></div>
=======
				<div class="form-control" name="sendbank">신한 000-00-000000</div>

				<div style="clear: both;"></div>
				<hr>
>>>>>>> branch 'master' of https://github.com/Kimsangeun/final.git
			</div>




			<!-- 카드결제 디브 -->

			<div id="cardview" style="display: none">
<<<<<<< HEAD
				
				<div class="S_s1" >카드종류</div>
				
				<select name="cardchk" class="form-control" style="width : 100px;">
=======
				<hr>

				<div class="S_s1">카드종류</div>

				<select name="cardchk" class="form-control">
>>>>>>> branch 'master' of https://github.com/Kimsangeun/final.git
					<option>신한</option>
					<option>대구</option>
					<option>BC</option>
					<option>서울</option>
					<option>국민</option>
					<option>신협</option>
					<option>농협</option>
					<option>경남</option>
				</select>
				<div style="clear: both;"></div>
				<hr>

				<div class="S_s1">카드번호</div>
<<<<<<< HEAD
				 
				<input type="text" class="form-control" id="cardnum1" name="cardnum1" maxlength="4" onKeyPress="return numkeyCheck(event)">
=======

				<input type="text" class="form-control" id="cardnum1"
					name="cardnum1" maxlength="4"
					onKeyPress="return numkeyCheck(event)" style="width: 30px">
>>>>>>> branch 'master' of https://github.com/Kimsangeun/final.git
				<div class="S_s">-</div>
<<<<<<< HEAD
				<input type="password" class="form-control" id="cardnum2" name="cardnum2" maxlength="4" onKeyPress="return numkeyCheck(event)">
=======
				<input type="password" class="form-control" id="cardnum2"
					name="cardnum2" maxlength="4"
					onKeyPress="return numkeyCheck(event)" style="width: 30px">
>>>>>>> branch 'master' of https://github.com/Kimsangeun/final.git
				<div class="S_s">-</div>
<<<<<<< HEAD
				<input type="password" class="form-control" id="cardnum3" name="cardnum3" maxlength="4" onKeyPress="return numkeyCheck(event)" > 
=======
				<input type="password" class="form-control" id="cardnum3"
					name="cardnum3" maxlength="4"
					onKeyPress="return numkeyCheck(event)" style="width: 30px">
>>>>>>> branch 'master' of https://github.com/Kimsangeun/final.git
				<div class="S_s">-</div>
<<<<<<< HEAD
				<input type="text" class="form-control" id="cardnum4" name="cardnum4" maxlength="4" onKeyPress="return numkeyCheck(event)" >
				
				<div style="clear: both;"></div><hr>
				<div class="S_s1">비밀번호</div> 
				
				<input type="password" class="form-control" id="cardpw" name="cardpw" maxlength="2" onKeyPress="return numkeyCheck(event)" >
				
				 <div class="S_s">**</div> 
				
				 <div style="clear: both;"></div><hr>
				 <div class="S_s1">유효기간</div> 
				 
				 <input type="text" class="form-control" name="cardnum4" maxlength="2" onKeyPress="return numkeyCheck(event)" > 
				 <div class="S_s">월</div>
				 <input type="text" class="form-control" name="cardnum4" maxlength="2" onKeyPress="return numkeyCheck(event)" > 
				 <div class="S_s">년</div>
				 
				 <div style="clear: both;"></div><hr>
				 <div class="S_s1">생년월일(6자리)</div> 
				 <input type="text" class="form-control" name="birth" maxlength="6" onKeyPress="return numkeyCheck(event)"  style="width : 100px;">
=======
				<input type="text" class="form-control" id="cardnum4"
					name="cardnum4" maxlength="4"
					onKeyPress="return numkeyCheck(event)" style="width: 30px">

				<div style="clear: both;"></div>
				<hr>
				<div class="S_s1">비밀번호</div>

				<input type="password" class="form-control" id="cardpw"
					name="cardpw" maxlength="2" onKeyPress="return numkeyCheck(event)"
					style="width: 40px">

				<div class="S_s">**</div>

				<div style="clear: both;"></div>
				<hr>
				<div class="S_s1">유효기간</div>

				<input type="text" class="form-control" name="cardnum4"
					maxlength="2" onKeyPress="return numkeyCheck(event)"
					style="width: 30px">
				<div class="S_s">월</div>
				<input type="text" class="form-control" name="cardnum4"
					maxlength="2" onKeyPress="return numkeyCheck(event)"
					style="width: 30px">
				<div class="S_s">년</div>

				<div style="clear: both;"></div>
				<hr>
				<div class="S_s1">생년월일(6자리)</div>
				<input type="text" class="form-control" name="birth" maxlength="6"
					onKeyPress="return numkeyCheck(event)" style="width: 45px">
>>>>>>> branch 'master' of https://github.com/Kimsangeun/final.git
			</div>

			<div style="clear: both;"></div>
			<hr>
			<!-- <input type="submit" value="결제하기" /> -->
			<div
				style="border: solid 2px gray; text-align: center; padding: 10px; font-size: 20px; cursor: pointer; width: 150px;"
				onclick="goPay()">결제하기</div>
		</form>
	</div>

	<!-- 결제정보 디브 -->
	<div style=""></div>
</div>
