<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
#S_top {
	float: left;
	background: lightgray;
	padding: 0 5%;
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
	float : left;
	padding : 3px 4px;
	margin-top : 2px;
}

.S_seat {
	padding : 2px 6px;
	margin : 5px; 
	border:solid 1px green;
	float: left;
	cursor: pointer;
}

.S_royalseat {
	padding : 2px 6px;
	margin : 5px;
	border:solid 1px  red;
	float: left;
}
</style>

<script type="text/javascript">

var ll= '${seatList}';
var list = ll.substring(1,ll.length-1).split(',');

window.onload = function(){
	//alert(list)
	
	for (var col = 1; col<= 4; col++) {
	
		var alpha = '';
		
		switch(col){
		
		case 1:
			alpha = 'A';
			break;
		case 2:
			alpha = 'B';
			break;
		case 3:
			alpha = 'C';
			break;
		case 4:
			alpha = 'D';
			break;
		}
		
		for(var no =1; no <=10; no++){
	 		for(ss in list){
	 			//alert(list[ss]);
	 			if(list[ss].trim() == alpha+no ){
	 				
	 				/* 예약된 좌석 처리부분. */
	 				
	 				$('#S_seat'+col+no).html('&nbsp;X&nbsp;');
	 				$('#S_seat'+col+no).css('background', "gray");
	 				$('#S_seat'+col+no).css('color', "lightgray");
	 				$('#S_seat'+col+no).css('pointer-events', "none");
	 				$('#S_seat'+col+no).css('cursor', "no-drop");
	 			}
	 		}
		}
	}
}

	var cnt = 0; // 인원수
	var price=0; // 총 가격
	var seats = ''; // 선택한 좌석
	var val = 0; // 현재 선택한 좌석수


	function chkseat(col, no) {
		var sel = document.getElementById("maxcnt");
		val = sel.options[sel.selectedIndex].value;
		
		var alpha = '';
		
		switch(col){
		
		case 1:
			alpha = 'A';
			break;
		case 2:
			alpha = 'B';
			break;
		case 3:
			alpha = 'C';
			break;
		case 4:
			alpha = 'D';
			break;
		}
		
		if (val <= cnt) {
			alert('선택한 좌석이 인원수보다 많습니다.' + cnt + "/" + val)
			return;
		}
		seats += alpha+no + ",";

		
		
		var money= 3000;
		if(alpha == 'D'){
			money += 1000;
		}
		
		price += money;
		
		$("#S_seat"+col+no).css("background","red");
		$("#S_seat"+col+no).css("color","lightgray");
		
		cnt++;
		
		$('#seatnums').text(seats);
		
		$('#price').text(price+'￦');

	}
	
	function selchg() {
		
		var splitSeat = seats.split(",");
		
		var numlist = '';
		
		for(var col=1; col<=4; col++){
			var alpha = '';
			
			switch(col){
			
			case 1:
				alpha = 'A';
				break;
			case 2:
				alpha = 'B';
				break;
			case 3:
				alpha = 'C';
				break;
			case 4:
				alpha = 'D';
				break;
			}
			
			for(var no=1;no<=10; no++){
				for(ss in list){
		 			if(list[ss].trim() == alpha+no ){
		 				numlist += '#S_seat'+col+no+' ' ;
		 			}
		 			
		 			$('#S_seat'+col+no).css('background','white' );
					$('#S_seat'+col+no).css('color','black' );
		 			
					seats = "";
					cnt = 0;
					price=0;
						
					$('#seatnums').text('');
					$('#price').text('');

						
		 		}
			}
		}
		
		numlist = numlist.split(' ');
		
		for (var i = 0; i < numlist.length; i++) {
			$(numlist[i]).css('background', 'gray');
			$(numlist[i]).css('color', 'lightgray');
			$(numlist[i]).html('&nbsp;X&nbsp;');
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

	<div id="S_top" style="border-right: solid 1px gray; ">
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
	<div id="S_top" style="width: 45%;">
		<div id="S_cho2" style="margin-top: 25px;">${svo.scNum }관</div>
		<div id="S_cho2" style="margin-top: 25px;">${svo.runtime}분</div>
		<div style="clear: both;"></div>
		<div id="S_cho2" style="font-size: 25px;">${svo.getDateDay() }</div>
		<div id="S_cho2" style="font-size: 25px;">${svo.mtime}</div>
	</div>
	<div style="clear: both;"></div>


	<hr>
	
 
 		<!-- 좌석선택 -->
 
		<div style="clear:both;"></div>
		
		<div  style="margin-left: 25%;">
		
		<div style="width: 300px; background: gray; text-align: center; margin: 10px; margin-left: 70px;">SCREEN</div>
		
		<div style="clear:both;"></div>
		
		<c:forEach begin="1" end="4" var="col">
		
			<div class="S_seatcol">
				<c:choose>
					<c:when test="${col==1 }"><div class="S_seatcol">A</div></c:when>
					<c:when test="${col==2 }"><div class="S_seatcol">B</div></c:when>
					<c:when test="${col==3 }"><div class="S_seatcol">C</div></c:when>
					<c:when test="${col==4 }"><div class="S_seatcol">D</div></c:when>
				</c:choose>
			</div>
			<c:forEach begin="1" end="10" var="no">
				<div class="S_<c:if test='${col==4 }'>royal</c:if>seat" id="S_seat${col }${no }" onclick="chkseat(${col},${no})">
				<c:if test="${no<10 }">&nbsp;</c:if>
				${no }
				</div>
			</c:forEach>
			
			<div style="clear:both;"></div>
		
		</c:forEach>
		
		</div>
		
		
	<hr>



	<!-- 좌석 몇번인지 보여주는 임시창 -->

	<div style="background: yellow;">
	<div style="font-size: 20px;">좌석번호</div>
	<div id="seatnums" style="font-size: 20px;"> </div>
	</div>
	
	<div style="background: gray;">
	<div style="font-size : 20px;" >결제금액</div>
	<div id="price" style="font-size : 20px; "> </div>
	</div>
	
	<div style="clear : both;"></div>
	
	<input type="hidden" name="seatnum" /> <input type="hidden" name="cnt" />
	<input type="hidden" name="price" />
	<div style="width: 80%;">
		<div onclick="chksubmit()"
			style="cursor: pointer; font-size: 40px; padding: 10px; border: solid 2px gray;">결제</div>
	</div>
</form>
