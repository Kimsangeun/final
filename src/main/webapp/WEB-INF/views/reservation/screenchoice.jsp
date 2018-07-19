<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
#S_top {
	float: left;
	background: lightgray;
	padding: 0 20px;
	height: 100px;
}

#S_cho1 {
	float: left;
	padding-right: 10px;
	font-size: 16px;
}

#S_cho2 {
	float: left;
	padding-right: 10px;
}

.S_seatcol{
	padding : 3px 6px;
	margin-top : 5px;
}

.seat {
	padding : 2px 6px;
	margin : 5px; 
	border: 1px solid green;
	float: left;
	/* 	cursor:crosshair; */
}

.royalseat {
	padding : 2px 6px;
	margin : 5px;
	border: 1px solid red;
	float: left;
}
</style>

<script type="text/javascript">
<%Set<String> SeatList = (Set<String>) request.getAttribute("seatList");%>

var list = <%=SeatList%>;

window.onload = function(){
 	for(var ii=1;ii<=40;ii++){
 		for(ss in list){
 			if(list[ss] == ii ){
 				/* 예약된 좌석 처리부분. */
 				var resered = document.getElementById('R_seat'+ii);
 		 		resered.style.backgroundColor= 'RED';
 				resered.style.pointerEvents = 'none';
 				
 				resered.style.cursor = 'no-drop'; 
 			}
 		}
	}
}

	var cnt = 0; // 인원수
	var price=0; // 총 가격
	var seats = ''; // 선택한 좌석
	var val = 0; // 현재 선택한 좌석수


	function chkseat(ii) {
		var sel = document.getElementById("maxcnt");
		val = sel.options[sel.selectedIndex].value;

		var chklist = seats.split(",");

		for (ss in chklist) {
			var jj = document.getElementById('R_seat'+chklist[ss]);

			if (ii == chklist[ss]) {
				try{

				if(chklist[ii]<=10){
					jj.style.border = '1px solid green';
					price -= 4000;
				}else{
					jj.style.border = '1px solid blue';
					price -= 3000;
				}
				}finally{
				val--;
				return;
				}
			}
		}
 
		var list = <%=SeatList%>;
		if (val <= cnt) {
			alert('선택한 좌석이 인원수보다 많습니다.' + cnt + "/" + val)
			return;
		}
		seats += ii + ",";

		
		
		var money= 3000;
		if(ii<=10){
			money += 1000;
		}
		
		price += money;
		$("#R_seat" + ii).css("background","red");
		$("#R_seat" + ii).css("color","white");
		cnt++;
		$('#seatnums').text(seats);
		
		$('#price').text(price);

	}
	
	function selchg() {
		
		var splitSeat = seats.split(",");
		
		for(ii in splitSeat){
			
			try{
				if(splitSeat[ii]<=10){
					$('#R_seat'+splitSeat[ii]).css('border','solid 2px red' );
					$('#R_seat'+splitSeat[ii]).css('background','white' );
					$('#R_seat'+splitSeat[ii]).css('color','black' );
				}else{
					$('#R_seat'+splitSeat[ii]).css('border','solid 2px green' );
					$('#R_seat'+splitSeat[ii]).css('background','white' );
					$('#R_seat'+splitSeat[ii]).css('color','black' );
					
				}
			}finally{
				seats = "";
				cnt = 0;
				price=0;
				
				$('#seatnums').text(seats);
				$('#price').text(price);

			}
		}
		/* 결제 팝업뜨게하고 최대한 비슷하게. */
		//동의합니다.
	}

	function chksubmit() {
		if (cnt == val && val != 0) {
			alert('좌석선택 완료.')

			document.seatfrm.cnt.value = cnt;
			document.seatfrm.seatnum.value = seats;
			document.seatfrm.price.value = price;

			document.seatfrm.submit();
		} else {
			alert('인원수를 확인하세요')
		}
	}
</script>


<form name="seatfrm" action="/proj/reservation/payment" method="post">
	<div>
		<h2>인원 / 좌석</h2>
	</div>

	<hr>

	<div id="S_top" style="border-right: solid 1px gray;">
		<div id="S_cho1" style="margin-top: 40px;">인원</div>
		<div id="S_cho1" style="margin-top: 35px;">
			<select id="maxcnt" class="form-control " name="maxcnt"
				onchange="selchg()">
				<c:forEach begin="0" end="9" var="ii">
					<option>${ii }</option>
				</c:forEach>
			</select>
		</div>
	</div>
	<div id="S_top">
		<img src="../resources/movposter/${svo.poster }" width="50px"
			style="margin-top: 15px; margin-right: 10px; float: left;" /> 
		<img src="../resources/imgs/
			<c:choose>
				<c:when test="${svo.grade ==18}">movie_icon_18.gif</c:when>
				<c:when test="${svo.grade ==15}">movie_icon_15.gif</c:when>
				<c:when test="${svo.grade ==12}">movie_icon_12.gif</c:when>
				<c:when test="${svo.grade == 0}">movie_icon_0.gif</c:when>
			</c:choose>
		" alt="이미지없음" width="25px" style="float: left; margin-top: 30px;"/>
		<div id="S_cho2" style="font-size: 25px; margin-top: 30px;">${svo.movtitle }</div>
	</div>
	<div id="S_top" style="width: 55%;">
		<div id="S_cho2" style="margin-top: 25px;">${svo.scNum }관</div>
		<div id="S_cho2" style="margin-top: 25px;">${svo.runtime}분</div>
		<div style="clear: both;"></div>
		<div id="S_cho2" style="font-size: 25px;">${svo.getDateDay() }</div>
		<div id="S_cho2" style="font-size: 25px;">${svo.mtime}</div>
	</div>
	<div style="clear: both;"></div>


	<hr>

<div style="margin-left: 25%;">
		<c:forEach begin="1" end="40" var="ii">
			<!-- 1부터 40까지 뿌리는데 숫자가 예약된 좌석에 포함되면 안되는걸로. -->
			<div align="center" class="<c:if test='${ii<=10 }'>royal</c:if>seat"
				id="R_seat${ii }" onclick="chkseat(${ii})" style="cursor : pointer;">
				${(ii-1)%10 }
			</div>
			<c:if test="${ii%10==0 }">
				<c:choose>
					<c:when test="${(ii-1)/10 < 1 }"><div class="S_seatcol">D</div></c:when>
					<c:when test="${(ii-1)/10 < 2 }"><div class="S_seatcol">C</div></c:when>
					<c:when test="${(ii-1)/10 < 3 }"><div class="S_seatcol">B</div></c:when>
					<c:when test="${(ii-1)/10 < 4 }"><div class="S_seatcol">A</div></c:when>
				</c:choose>
			<div style="clear:both;"></div>
			</c:if>
			<!-- resered(ii) -->
		</c:forEach>

</div>

	<hr>



	<!-- 좌석 몇번인지 보여주는 임시창 -->

	<div id="seatnums"></div>
	<div id="price"></div>
	<input type="hidden" name="seatnum" /> <input type="hidden" name="cnt" />
	<input type="hidden" name="price" />
	<div style="width: 80%;">
		<div onclick="chksubmit()"
			style="cursor: pointer; float: right; font-size: 40px; padding: 10px; border: solid 2px gray;">결제</div>
	</div>
</form>
