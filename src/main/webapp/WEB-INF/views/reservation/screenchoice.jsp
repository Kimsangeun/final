<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
.seat {
	width: 20px;
	height: 20px;
	border: 1px solid red;
	float: left;
}
</style>

<script type="text/javascript">
	var cnt = 0;
	var val = 0;
	var seats = "";

	document.getElementById("maxcnt").onchange
	function chkseat(ii) {
		var sel = document.getElementById("maxcnt");
		val = sel.options[sel.selectedIndex].value;
		if (val <= cnt) {
			alert('선택한 좌석이 인원수보다 많습니다.' + cnt + "/" + val)
			return;
		}
		seats += ii + ",";

		var seat = document.getElementById("R_seat" + ii);
		cnt++;
		alert("val:" + val + "cnt:" + cnt + "//seats:" + seats);

		$('#seatnums').text(seats);
		
	}

	function selchg() {
		seats = "";
		cnt = 0;

		$('#seatnums').text(seats);

	}
	
	function chksubmit(){
		if(cnt != val){
			alert('틀린데?')
		}
		else{
			alert('맞네 넘어간다.')
			$('#ryu1').html(cnt);
			$('#ryu2').html(seats);
			document.seatfrm.submit();
		}
	}
	
</script>

<c:set var="rr" value="<div id='ryu1'> </div>"/>
<form name="seatfrm" action="/proj/reservation/payment" method="post">
	<div>
		<select id="maxcnt" name="maxcnt" onchange="selchg()">
			<c:forEach begin="0" end="9" var="ii">
				<option>${ii }</option>
			</c:forEach>
		</select>명

	</div>

	<div>
		<c:forEach begin="1" end="40" var="ii">
			<div class="seat" id="R_seat${ii }" onclick="chkseat(${ii})" >${ii }</div>
			<c:if test="${ii%10==0 }">
				<br>
			</c:if>
		</c:forEach>
	</div>


	<!-- 좌석 몇번인지 보여주는 임시창 -->
	<div id="seatnums"></div>

	<input type="button" value="결제하러갑시다" onclick="chksubmit()"/>
</form>
