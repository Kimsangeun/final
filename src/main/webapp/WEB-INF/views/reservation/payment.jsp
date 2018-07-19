<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script type="text/javascript">
	function div_OnOff(v, id) {
		// 라디오 버튼 value 값 조건 비교
		if (v == "crd") {
			document.getElementById('cashview').style.display = "none"; // 보여줌
			document.getElementById('cardview').style.display = ""; // 보여줌
		} else {
			document.getElementById('cardview').style.display = "none"; // 숨김
			document.getElementById('cashview').style.display = ""; // 보여줌
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
		if($("#cardpw")!=2){
			alert('비밀 번호를 확인하세요.');
			return;
		}
		document.pendfrm.submit();
	}
	
</script>

<div>
	<div style="width: 300px; float: left">
		<form action="/proj/reservation/payend" method="post" id="pendfrm">

			<input type="radio" name="paytype" value="csh" id="cash"
				onclick="div_OnOff(this.value,'cashview')"> 계좌이체 <input
				type="radio" name="paytype" value="crd" id="card"
				onclick="div_OnOff(this.value,'cardview')"> 카드결제 <br>




			<!-- 계좌이체 디브 -->

			<div id="cashview" style="display: none">
				게좌이체.<br> <br> 계좌번호<input type="text" name="banknum"><br>
				비밀번호<input type="text" name="bankpw"><br> 보낼 계좌 <input
					type="text" name="sendbank" value="신한 000-00-000000" readonly>


			</div>


			<!-- 카드결제 디브 -->
			<div id="cardview" style="display: none">
				카드결제. <select name="cardchk">
					<option>신한</option>
					<option>대구</option>
					<option>BC</option>
					<option>서울</option>
					<option>국민</option>
					<option>신협</option>
					<option>농협</option>
					<option>경남</option>
				</select>
				 <br> 
				 카드번호<input type="text" id="cardnum1" name="cardnum1" maxlength="4" onKeyPress="return numkeyCheck(event)" style="width: 30px">
				- <input type="password" id="cardnum2" name="cardnum2" maxlength="4" onKeyPress="return numkeyCheck(event)" style="width: 30px">
				- <input type="password" id="cardnum3" name="cardnum3" maxlength="4" onKeyPress="return numkeyCheck(event)" style="width: 30px"> 
				- <input type="text" id="cardnum4" name="cardnum4" maxlength="4" onKeyPress="return numkeyCheck(event)" style="width: 30px">
				<br>
				비밀번호 <input type="password" id="cardpw" name="cardpw" maxlength="2" onKeyPress="return numkeyCheck(event)" style="width: 15px">
				 ** 
				 <br> 
				 유효기간 <input type="text" name="cardnum4" maxlength="2" onKeyPress="return numkeyCheck(event)" style="width: 30px"> 월 
				 <input type="text" name="cardnum4" maxlength="2" onKeyPress="return numkeyCheck(event)" style="width: 30px"> 년	
				 <br> 
				 생년월일(6자리) <input type="text" name="birth" maxlength="6" onKeyPress="return numkeyCheck(event)" style="width: 45px">
			</div>
			<br>
			
			<!-- <input type="submit" value="결제하기" /> -->
			<input type="button" value="결제하기" onclick="goPay()"/>
		</form>
	</div>

	<!-- 결제정보 디브 -->
	<div style=""></div>
</div>
