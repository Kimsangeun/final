<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
.seat {
	width: 30px;
	height: 30px;
	margin-bottom: 10px;
	margin-left: 10px;
	border: 1px solid blue;
	float: left;
	/* 	cursor:crosshair; */
}
 
.royalseat {
	width: 30px;
	height: 30px;
	margin-bottom: 10px;
	margin-left: 10px;
	border: 1px solid green;
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
	var seats = ""; // 선택한 좌석
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
		var seat = document.getElementById("R_seat" + ii);
		seat.style.border = '5px solid blue';
		cnt++;
		$('#seatnums').text(seats);
		
		$('#price').text(price);

	}
	
	function selchg() {
		var splitSeat = seats.split(",");
		for(ii in splitSeat){
			var ss = document.getElementById('R_seat'+splitSeat[ii]);
			
			try{
				if(splitSeat[ii]<=10){
					ss.style.border = '1px solid green';
				}else{
					ss.style.border = '1px solid blue';
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

${svo.movtitle } ${svo.mdate } ${svo.mtime}
<form name="seatfrm" action="/proj/reservation/payment" method="post">
	<div>
		<select id="maxcnt" name="maxcnt" onchange="selchg()">
			<c:forEach begin="0" end="9" var="ii">
				<option>${ii }</option>
			</c:forEach>
		</select>명
	</div>
	<div align="center">
		<c:forEach begin="1" end="40" var="ii">
			<!-- 1부터 40까지 뿌리는데 숫자가 예약된 좌석에 포함되면 안되는걸로. -->
			<div class="<c:if test='${ii<=10 }'>royal</c:if>seat"
				id="R_seat${ii }" onclick="chkseat(${ii})"
				style="background-color: lightgray;">
				<c:choose>

					<c:when test="${(ii-1)/10 < 1 }">A</c:when>
					<c:when test="${(ii-1)/10 < 2 }">B</c:when>
					<c:when test="${(ii-1)/10 < 3 }">C</c:when>
					<c:when test="${(ii-1)/10 < 4 }">D</c:when>

				</c:choose>
				${(ii-1)%10 }
			</div>
			<c:if test="${ii%10==0 }">
				<br>
				<br>
			</c:if>
			<!-- resered(ii) -->
		</c:forEach>
	</div>

	<!-- 좌석 몇번인지 보여주는 임시창 -->
	<div id="seatnums"></div>
	<div id="price"></div>
	<input type="hidden" name="seatnum" /> <input type="hidden" name="cnt" />
	<input type="hidden" name="price" /> <input type="button"
		value="결제하러갑시다" onclick="chksubmit()" />
</form>
