<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<link rel="stylesheet" href="/proj/resources/bootstrap-3.2.0-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/proj/resources/bootstrap-3.2.0-dist/css/bootstrap-theme.min.css">
<script type="text/javascript" src="/proj/resources/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/proj/resources/bootstrap-3.2.0-dist/js/bootstrap.min.js"></script>


<script type="text/javascript">

	$(function() {
		$('ul.nav-tabs a').click(function(e) {
			e.preventDefault()
			$(this).tab('show')
		})
	})


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

	function goPay() {
		var selectPay = $('input:radio[name="paytype"]:checked').val();

		/* 		alert('월:'+$("#month").val()) */
		if (selectPay == 'crd') {
			var totalnum = $("#cardnum1").val().length + $("#cardnum2").val().length + $("#cardnum3").val().length + $("#cardnum4").val().length;

			if (totalnum != 16) {
				alert('카드 번호를 확인하세요.');
				return;
			} else if ($("#cardpw").val().length != 2) {
				alert('비밀 번호를 확인하세요.');
				return;
			}


			var mm = $("#month").val();
			var yy = $("#year").val();

			var YY = new Date().getYear() - 100;
			var MM = new Date().getMonth();


			if (mm < 1 || mm > 12) {
				alert('유효 기간을 확인하세요.[월]');
			} else if (yy < YY || (yy == YY && mm <= MM) || yy > (YY + 4)) {
				alert('유효 기간을 확인하세요.[년]');

			}

			/* 			if(yy<YY || (yy==YY && mm<MM) || yy>(YY+4)){
							alert('유효 기간을 확인하세요.');
							return;
						} */

		} else if (selectPay == 'csh') {
			if ($("#banknum").val().length == 0) {
				alert('계좌 번호를 입력하세요.');
				return;
			}

			if ($("#bankpw".val().length) != 4) {
				alert('비밀 번호를 확인하세요.');
				return;
			}
		}
	/* 		document.pendfrm.submit(); */
	}
</script>

<div>
	<!-- 전체 디브 -->

	<nav class="navbar navbar-default">
	<div>
		<ul class="nav navbar-nav nav-tabs">
			<li class="active"><a href="#first">은행 계좌이체</a></li>
			<li><a href="#second">카드결제</a></li>
		</ul>
	</div>
	</nav>
	<form action="/proj/reservation/payend" method="post" id="pendfrm">

		<div class="tab-content" style="margin-top: 80px;">
			<div class="tab-pane fade active in" id="first">
				<p>
				<select name="bankchk">
				<option>은행선택</option>
				<option>하나은행</option>
				<option>신한은행</option>
				<option>농협은행</option>
				<option>기업은행</option>
				<option>대구은행</option>
				<option>부산은행</option>
				<option>경남은행</option>
				<option>전남은행</option>
				<option>광주은행</option>
				</select>
				
				</p>
			</div>
			<div class="tab-pane fade" id="second">
				<p>
					<select name="cardchk">
						<option>카드선택</option>
						<option>삼성</option>
						<option>비씨</option>
						<option>하나</option>
						<option>우리</option>
						<option>국민</option>
						<option>수협</option>
						<option>농협</option>
						<option>카카오</option>
					</select> <br> 카드번호<input type="text" id="cardnum1" name="cardnum1"
						maxlength="4" onKeyPress="return numkeyCheck(event)"
						style="width: 40px"> - <input type="password"
						id="cardnum2" name="cardnum2" maxlength="4"
						onKeyPress="return numkeyCheck(event)" style="width: 40px">
					- <input type="password" id="cardnum3" name="cardnum3"
						maxlength="4" onKeyPress="return numkeyCheck(event)"
						style="width: 40px"> - <input type="text" id="cardnum4"
						name="cardnum4" maxlength="4"
						onKeyPress="return numkeyCheck(event)" style="width: 40px">
					<br> 비밀번호 <input type="password" id="cardpw" name="cardpw"
						maxlength="2" onKeyPress="return numkeyCheck(event)"
						style="width: 15px"> ** <br> 유효기간 <input type="text"
						id="month" maxlength="2" onKeyPress="return numkeyCheck(event)"
						style="width: 30px"> 월 <input type="text" id="year"
						maxlength="2" onKeyPress="return numkeyCheck(event)"
						style="width: 30px"> 년 <br> 생년월일(6자리) <input
						type="text" name="birth" maxlength="6"
						onKeyPress="return numkeyCheck(event)" style="width: 45px">
			</div>
		</div>
		<button type="button" class="btn btn-primary btn-lg"
			data-toggle="modal" data-target="#myModal">선택완료</button>
		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">결제 팝업창</h4>
					</div>
					<div class="modal-body">
						계좌번호<input type="text" name="banknum" id="banknum" maxlength="16"
							onKeyPress="return numkeyCheck(event)"><br> 비밀번호<input
							type="text" name="bankpw" id="bankpw" maxlength="4"
							onKeyPress="return numkeyCheck(event)"><br> 보낼 계좌 <input
							type="text" name="sendbank" value="신한 000-00-000000" readonly>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-primary">결제</button>
					</div>
				</div>
			</div>
		</div>
		<input type="button" value="결제하기" onclick="goPay()" />
	</form>


	<!-- 
	<div>
		<div style="width: 300px; float: left">

				<input type="radio" name="paytype" value="csh" id="cash"
					onclick="div_OnOff(this.value,'cashview')"> 계좌이체 <input
					type="radio" name="paytype" value="crd" id="card"
					onclick="div_OnOff(this.value,'cardview')"> 카드결제 <br>


				<input type="submit" value="결제하기" />
				<input type="button" value="결제하기" onclick="goPay()" />
		</div>

		결제정보 디브
		<div style=""></div> -->
</div>