<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
.form-control{
	float : left;
}

.S_s{
	float: left;
	margin: 0 8px;
	margin-top : 8px;
}
.S_s1{
	float: left;
	margin: 0 8px;
	margin-right: 10%;
}
</style>

<script type="text/javascript">
	function div_OnOff(v, id) {
		// 라디오 버튼 value 값 조건 비교
		if (v == "crd") {
			$('#cashview').css('display','none');
			$('#cardview').css('display','');
			//document.getElementById('cashview').style.display = "none"; // 보여줌
			//document.getElementById('cardview').style.display = ""; // 보여줌
		} else {
			$('#cashview').css('display','');
			$('#cardview').css('display','none');	
			//document.getElementById('cardview').style.display = "none"; // 숨김
			//document.getElementById('cashview').style.display = ""; // 보여줌
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
	<div>
		<h2>결제하기</h2>
	</div>

	<hr>

	<div style="width: 300px; float: left">
		<form action="/proj/reservation/payend" method="post" id="pendfrm">
			<div style="margin: 0 20px; float : left;">
			<input type="radio" name="paytype" value="csh" id="cash"
				onclick="div_OnOff(this.value,'cashview')"> 계좌이체 </div>
			<div>
			<input
				type="radio" name="paytype" value="crd" id="card"
				onclick="div_OnOff(this.value,'cardview')"> 카드결제 </div>


	<hr>

			<!-- 계좌이체 디브 -->

			<div id="cashview" style="display: none">
				<div class="S_s1">계좌번호</div>
				<input type="text" class="form-control" name="banknum">
				
				<div style="clear: both;"></div><hr>
					
				<div class="S_s1">비밀번호</div>
				<input type="text" class="form-control" name="bankpw"> 
				
				<div style="clear: both;"></div><hr>
					
				<div class="S_s1">보낼 계좌</div>
				<div  class="form-control" name="sendbank">신한 000-00-000000</div>
				
				<div style="clear: both;"></div><hr>
			</div>


			
			
			<!-- 카드결제 디브 -->
			
			<div id="cardview" style="display: none">
				<hr>
				
				<div class="S_s1" >카드종류</div>
				
				<select name="cardchk" class="form-control">
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
				 
				<input type="text" class="form-control" id="cardnum1" name="cardnum1" maxlength="4" onKeyPress="return numkeyCheck(event)" style="width: 30px">
				<div class="S_s">-</div>
				<input type="password" class="form-control" id="cardnum2" name="cardnum2" maxlength="4" onKeyPress="return numkeyCheck(event)" style="width: 30px">
				<div class="S_s">-</div>
				<input type="password" class="form-control" id="cardnum3" name="cardnum3" maxlength="4" onKeyPress="return numkeyCheck(event)" style="width: 30px"> 
				<div class="S_s">-</div>
				<input type="text" class="form-control" id="cardnum4" name="cardnum4" maxlength="4" onKeyPress="return numkeyCheck(event)" style="width: 30px">
				
				<div style="clear: both;"></div><hr>
				<div class="S_s1">비밀번호</div> 
				
				<input type="password" class="form-control" id="cardpw" name="cardpw" maxlength="2" onKeyPress="return numkeyCheck(event)" style="width: 15px">
				
				 <div class="S_s">**</div> 
				
				 <div style="clear: both;"></div><hr>
				 <div class="S_s1">유효기간</div> 
				 
				 <input type="text" class="form-control" name="cardnum4" maxlength="2" onKeyPress="return numkeyCheck(event)" style="width: 30px"> 
				 <div class="S_s">월</div>
				 <input type="text" class="form-control" name="cardnum4" maxlength="2" onKeyPress="return numkeyCheck(event)" style="width: 30px"> 
				 <div class="S_s">년</div>
				 
				 <div style="clear: both;"></div><hr>
				 <div class="S_s1">생년월일(6자리)</div> 
				 <input type="text" class="form-control" name="birth" maxlength="6" onKeyPress="return numkeyCheck(event)" style="width: 45px">
			</div>
			
			<div style="clear: both;"></div><hr>
			<!-- <input type="submit" value="결제하기" /> -->
			<div style="border:solid 2px gray; text-align: center; padding:10px; font-size:20px; cursor:pointer; width:150px;" onclick="goPay()">결제하기</div>
		</form>
	</div>

	<!-- 결제정보 디브 -->
	<div style=""></div>
</div>
