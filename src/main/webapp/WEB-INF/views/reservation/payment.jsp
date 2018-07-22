<%@page import="java.io.IOException"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
.form-control {
	float: left;
}

.R_left {
	width: 30%;
	float: left;
	margin: 0 8px;
	margin-right: 10%;
	text-align: center;
}

.R_left {
	width: 70%;
	float: left;
	margin: 0 8px;
	margin-right: 10%;
	text-align: center;
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

.R_leftbox {
	float: left;
	margin: 0 8px;
}

.R_leftbox {
	clear: both;
	margin: 0 8px;
}
</style>
<script type="text/javascript">

	var payname = '';
	var selectPay;
	$(document).ready(function() {
		$("#allchk").click(function() {
			if ($("#allchk").prop("checked")) {
				$("input[name=check]").prop("checked", true);
			} else {
				$("input[name=check]").prop("checked", false);
			}
		})
	})


	function aaaaa(v) {
		selectPay = v;
		if (v == "crd") {
			$('#cashview').css('display', 'none');
			$('#cardview').css('display', '');
			$("#selectbank [value='def']").attr("selected", "selected");
		} else {
			$('#cashview').css('display', '');
			$('#cardview').css('display', 'none');
			$("#selectcard [value='def']").attr("selected", "selected");
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
			var cvc = $("#cvc").val();

			var YY = new Date().getYear() - 100;
			var MM = new Date().getMonth();


			if (mm < 1 || mm > 12) {
				alert('유효 기간을 확인하세요.[월]');
				return;
			} else if (yy < YY || (yy == YY && mm <= MM) || yy > (YY + 4)) {
				alert('유효 기간을 확인하세요.[년]');
				return;
			}

			if (cvc.length != 3) {
				alert('cvc 3자리를 입력하세요.');
				return;
			}

		} else if (selectPay == 'csh') {
			if ($("#banknum").val().length == 0) {
				alert('계좌 번호를 입력하세요.');
				return;
			}

			if ($("#bankpw").val().length != 4) {
				alert('비밀 번호를 확인하세요.');
				return;
			}
		}
		else
			alert(selectPay);
		document.pendfrm.submit();
	}

	/* 	function selchangebank() {
			payname = $('select[name=bankchk]').val();
			if (payname == "은행선택") {
				$('#bankmbtn').css('display', 'none');
			} else {
				$('#bankmbtn').css('display', '');
			}

			var title = document.getElementById("bankModalLabel");
			title.innerHTML = payname;
		} */

	function selchange() {
		var titleid;
		if (selectPay == 'csh') {
			payname = $('select[name=bankchk]').val();
			if (payname == "def") {
				$('#bankmbtn').css('display', 'none');
			} else {
				$('#bankmbtn').css('display', '');
			}

			titleid = 'bankModalLabel';
		} else {
			payname = $('select[name=cardchk]').val();
			if (payname == "def") {
				$('#agree').css('display', 'none');
			} else {
				$('#agree').css('display', '');
			}
			titleid = 'cardModalLabel';
			document.getElementById('agreeModalLabel').innerHTML = payname;
		}

		var title = document.getElementById(titleid);
		title.innerHTML = payname;
	}


	/* 	function selchangecard() {
			payname = $('select[name=cardchk]').val();
			if (payname == '카드선택') {
				$('#agree').css('display', 'none');
			} else {
				$('#agree').css('display', '');
			}
			var title = document.getElementById("agreeModalLabel");
			title.innerHTML = payname;
		} */

	function chkchk() {
/* 		alert($("input:checkbox[name=check]:checked").length); */
		if ($("input:checkbox[name=check]:checked").length == 4) {

			$('#agreeexit').trigger('click');

			if (selectPay == 'csh') {
				$('#bankmbtn').trigger('click');
			} else if (selectPay == 'crd') {
				$('#cardmbtn').trigger('click');
			}

		} else {
			alert('결제전 동의가 필요합니다.')
		}
	}
</script>



<div>
	<div>
		<h2>결제하기</h2>
	</div>
	<hr>



	<div align="center">
		<div class="modal fade" id="agreeModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header" id="aass">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
						<h4 class="modal-title" id="agreeModalLabel">TITLE</h4>
					</div>
					<div class="modal-body">
						<div class="R_leftbox">
							<b>개인정보 처리방침</b><br>
							<textarea rows="5" cols="30" style="resize: none">${agree1 }</textarea>
							<br> <input type="checkbox" name="check">약관을 읽었으며, 동의합니다.
						</div>
						<div class="R_rightbox">
							<b>영상정보 처리기기 운영 관리.방침</b><br>
							<textarea rows="5" cols="30" style="resize: none">${agree2 }</textarea>
							<br> <input type="checkbox" name="check">약관을 읽었으며, 동의합니다.
						</div>

						<div class="R_leftbox">
							<b>전자금융거래 이용약관</b><br>
							<textarea rows="5" cols="30" style="resize: none">${agree3 }</textarea>
							<br> <input type="checkbox" name="check">약관을 읽었으며, 동의합니다.
						</div>
						<div class="R_rightbox">
							<b>회원약관</b><br>
							<textarea rows="5" cols="30" style="resize: none">${agree4 }</textarea>
							<br> <input type="checkbox" name="check">약관을 읽었으며, 동의합니다.
						</div>
					</div>

					<div class="modal-footer">
						<input type="checkbox" name="allcheck" id="allchk">전체
						<button type="button" class="btn btn-default" id="agreeexit"
							data-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-primary" onclick="chkchk()">확인</button>
					</div>
				</div>
			</div>
		</div>




		<div style="width: 100%; float: left; padding: 0 30%" align="center">
			<form action="/proj/reservation/payend" method="post" id="pendfrm"
				name="pendfrm">
				<div style="margin: 0 20px; float: left;">
					계좌이체 <input type="radio" name="paytype" value="csh" id="cash"
						onclick="aaaaa('csh')">
				</div>
				<div>
					카드결제 <input type="radio" name="paytype" value="crd" id="card"
						onclick="aaaaa('crd')">
				</div>


				<hr>

				<!-- 계좌이체 디브 -->

				<div id="cashview" style="display: none">
					<div class="S_s1">은행선택</div>
					<div class="tab-pane fade active in" id="first">
						<p>
							<select name="bankchk" class="form-control" id="selectbank"
								onchange="selchange()">

								<option value='def'>선택</option>
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
						<div style="clear: both;"></div>
						<hr>
					</div>


					<!-- Modal -->

					<button type="button" class="btn btn-primary btn-lg" id="bankmbtn"
						data-toggle="modal" data-target="#bankModal" style="display: none">선택완료</button>
					<div class="modal fade" id="bankModal" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header" id="aass">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
									<h4 class="modal-title" id="bankModalLabel"></h4>
								</div>
								<div class="modal-body" style="padding: 5% 10%">

									<div class="S_s1">계좌번호</div>
									<input type="text" class="form-control" maxlength="16"
										id="banknum" onKeyPress="return numkeyCheck(event)"
										name="banknum">

									<div style="clear: both;"></div>
									<div style="margin: 5% 0">
										<div class="S_s1">비밀번호</div>
										<input type="password" class="form-control" maxlength="4"
											id="bankpw" onKeyPress="return numkeyCheck(event)"
											name="bankpw">
										<div style="clear: both;"></div>
									</div>

									<div class="S_s1">보낼 계좌</div>
									<div class="form-control">신한 000-00-000000</div>

									<div style="clear: both;"></div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" id="bankexid"
										data-dismiss="modal">닫기</button>
									<button type="button" class="btn btn-primary" onclick="goPay()">결제</button>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- 카드결제 디브 -->

				<div id="cardview" style="display: none">

					<div class="S_s1">카드종류</div>

					<select name="cardchk" class="form-control" id="selectcard"
						onchange="selchange()">
						<option selected="selected" value='def'>선택</option>
						<option>신한</option>
						<option>대구</option>
						<option>비씨</option>
						<option>서울</option>
						<option>국민</option>
						<option>신협</option>
						<option>농협</option>
						<option>경남</option>
					</select>
					<div style="clear: both;"></div>
					<hr>
					<button type="button" class="btn btn-primary btn-lg" id="agree"
						data-toggle="modal" data-target="#agreeModal"
						style="display: none">선택완료</button>
					<button type="button" class="btn btn-primary btn-lg" id="cardmbtn"
						style="display: none" data-toggle="modal" data-target="#cardModal">선택완료</button>

					<!-- Modal -->
					<div class="modal fade" id="cardModal" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header" id="aass">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
									<h4 class="modal-title" id="cardModalLabel"></h4>
								</div>
								<div class="modal-body">
									<div class="S_s1" style="width: 30%">카드번호</div>
									<!-- 								<div style="clear: both;"></div> -->

									<input type="text" class="form-control" id="cardnum1"
										name="cardnum1" maxlength="4"
										onKeyPress="return numkeyCheck(event)" style="width: 60px">
									<div class="S_s">-</div>
									<input type="password" class="form-control" id="cardnum2"
										name="cardnum2" maxlength="4"
										onKeyPress="return numkeyCheck(event)" style="width: 60px">
									<div class="S_s">-</div>
									<input type="password" class="form-control" id="cardnum3"
										name="cardnum3" maxlength="4"
										onKeyPress="return numkeyCheck(event)" style="width: 60px">
									<div class="S_s">-</div>
									<input type="text" class="form-control" id="cardnum4"
										name="cardnum4" maxlength="4"
										onKeyPress="return numkeyCheck(event)" style="width: 60px">

									<div style="clear: both;"></div>
									<hr>
									<div class="S_s1" style="width: 30%">비밀번호</div>

									<input type="password" class="form-control" id="cardpw"
										name="cardpw" maxlength="2"
										onKeyPress="return numkeyCheck(event)" style="width: 40px">

									<div class="S_s">**</div>

									<div style="clear: both;"></div>
									<hr>
									<div class="S_s1" style="width: 30%">할부</div>


									<select name="installment" class="form-control"
										style="float: left; width: auto">
										<option value='0'>일시불</option>
										<option value='1'>1</option>
										<option value='2'>2</option>
										<option value='3'>3</option>
									</select>
									<div class="S_s">개월</div>

									<div style="clear: both;"></div>
									<hr>
									<div class="S_s1" style="width: 30%">유효기간</div>

									<input type="text" class="form-control" name="cardnum4"
										id="month" maxlength="2"
										onKeyPress="return numkeyCheck(event)" style="width: 50px">
									<div class="S_s">월</div>
									<input type="text" class="form-control" name="cardnum4"
										id="year" maxlength="2" onKeyPress="return numkeyCheck(event)"
										style="width: 50px">
									<div class="S_s">년</div>

									<div style="clear: both;"></div>
									<hr>
									<div class="S_s1" style="width: 30%">CVC</div>
									<input type="text" class="form-control" name="birth" id="cvc"
										maxlength="3" onKeyPress="return numkeyCheck(event)"
										style="width: 60px">

								</div>

								<div style="clear: both;"></div>
								<hr>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" id="cardexit"
									data-dismiss="modal">닫기</button>
								<button type="button" class="btn btn-primary" onclick="goPay()">결제</button>
							</div>
						</div>
					</div>
				</div>
				<!-- <input type="submit" value="결제하기" /> -->
				<!-- 			<div
				style="border: solid 2px gray; text-align: center; padding: 10px; font-size: 20px; cursor: pointer; width: 150px;"
				onclick="goPay()">결제하기</div> -->
			</form>
		</div>
	</div>
	<!-- 결제정보 디브 -->
</div>
