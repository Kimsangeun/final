<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
#S_top {
	float: left;
	background: #353535;
	padding: 0 3% ;
	height: 100px;
	color :#F6F6F6;
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

.S_seatcol {
	float: left;
	padding: 3px 4px;
	margin-top: 2px;
}

.S_seat {
	padding: 2px 6px;
	margin: 5px;
	border: solid 1px green;
	float: left;
	cursor: pointer;
	width : 27px;
	text-align: center;
	border-radius: 2px;
}

.S_royalseat {
	padding: 2px 6px;
	margin: 5px;
	border: solid 1px red;
	float: left;
	cursor: pointer;
	width : 27px;
	text-align: center;
	border-radius: 2px;
}

#S_btn {
	cursor: pointer;
	font-size: 30px;
	width: 100px;
	padding: 10px 5px; 
	text-align: center;
	border: solid 2px #5D5D5D;
	margin-left: 95%;
}
#S_btn:hover {
	background: #4C4C4C;
	color : #F6F6F6;
}
</style>

<script type="text/javascript">

var ll= '${seatList}';
var list = ll.substring(1,ll.length-1).split(',');

var arr1 = '';
var arr2 = '';
var arr3 = '';
var arr4 = '';

for(var no=1;no<=10;no++){
	arr1+= 0+" ";
	arr2+= 0+" ";
	arr3+= 0+" ";
	arr4+= 0+" ";
}

arr1 = arr1.trim().split(' ');
arr2 = arr2.trim().split(' ');
arr3 = arr3.trim().split(' ');
arr4 = arr4.trim().split(' ');

arr = [arr1, arr2, arr3, arr4];

window.onload = function(){
	//alert(list)
	//alert(arr[0][0]);
	
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
	 				
	 				$('#S_seat'+col+no)
					 				.html('X')
					 				.css("background-color", "gray")
					 				.css('color', "lightgray")
					 				.css('pointer-events', "none")
					 				.css('text-align', "center")
					 				.css('cursor', "no-drop");
	 			}
	 		}
		}
	}
}

	var cnt = 0; // 인원수
	var price=0; // 총 가격
	var seats = ''; // 선택한 좌석
	var val = 0; // 현재 선택한 좌석수


	var seat = '';
	
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
		
		
		if(arr[col-1][no-1] == 0){
		
			if (val <= cnt) {
				alert('선택한 좌석이 인원수보다 많습니다.' + cnt + "/" + val)
				return;
			}
			
			$("#S_seat"+col+no)
							.css("background-color","#ff0000")
							.css("color","white");
 			arr[col-1][no-1] = 1;
			//alert(arr);
			
			var money= 3000;
			if(alpha == 'D'){
				money += 1000;
			}

			price += money;
 			cnt++;
		
		}else if(arr[col-1][no-1] == 1){
			
			$("#S_seat"+col+no).css("background-color","#ffffff");
			$("#S_seat"+col+no).css("color","black");
			arr[col-1][no-1] = 0;
			//alert(arr);
			
			var money= -3000;
			if(alpha == 'D'){
				money -= 1000;
			}
			
			price += money;
			cnt--;
			
		} 
		seat = '';
		
		for (var i = 0; i < 4; i++) {
			
			for (var j = 0; j < 10; j++) {
				if(arr[i][j] == 1){
				
					switch(i){
					
					case 0:
						alpha = 'A';
						break;
					case 1:
						alpha = 'B';
						break;
					case 2:
						alpha = 'C';
						break;
					case 3:
						alpha = 'D';
						break;
					}
					
					seat += alpha+(j+1)+',';
					//alert(seat)
				}
			}
		}
		
		$('#S_seatnums').html(seat);
		$('#S_price').html(price+'￦');

	}
	
	function selchg(scnum) {
	
		for(var col=1; col<=4; col++){
			for(var no=1;no<=10; no++){
				arr[col-1][no-1] = 0;
				switch(scnum){
	 			case 1:
	 				if(no!=5 && no!=6){
	 					$('#S_seat'+col+no)
	 						.css("background-color","#ffffff" )
							.css("color","black" );
	 				}
	 				break;
	 			case 2:
	 				$('#S_seat'+col+no)
							.css("background-color","#ffffff" )
						.css("color","black" );
	 				break;
	 			case 3:
	 				if(no!=3 && no!=8){
	 					$('#S_seat'+col+no)
								.css("background-color","#ffffff" )
							.css("color","black" );
	 				}
	 				break;
	 			case 4:
	 				if((col==1 && col==2)||(no==9 &&no==10) ){
		 				$('#S_seat'+col+no)
 						.css("background-color","#ffffff" )
						.css("color","black" );
	 				}
	 				break;
	 			
	 			}
			}
		} 
		//alert(arr)
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
		 			switch(scnum){
		 			case 1:
		 				if(no!=5 && no!=6){
		 					$('#S_seat'+col+no)
		 						.css("background-color","#ffffff" )
								.css("color","black" );
		 				}
		 				break;
		 			case 2:
		 				$('#S_seat'+col+no)
 							.css("background-color","#ffffff" )
							.css("color","black" );
		 				break;
		 			case 3:
		 				if(no!=3 && no!=8){
		 					$('#S_seat'+col+no)
 								.css("background-color","#ffffff" )
								.css("color","black" );
		 				}
		 				break;
		 			case 4:
		 				if((col==1 && col==2)||(no==9 &&no==10) ){
			 				$('#S_seat'+col+no)
	 						.css("background-color","#ffffff" )
							.css("color","black" );
		 				}
		 				break;
		 			
		 			}
		 			
					seats = '';
					cnt = 0;
					price=0;
						
					$('#S_seatnums').text('');
					$('#S_price').text('');
		 		}
			}
		}
		
		numlist = numlist.split(' ');
		
		for (var i = 0; i < numlist.length; i++) {
			$(numlist[i]).css("background", "gray");
			$(numlist[i]).css("color", "lightgray");
			$(numlist[i]).html("&nbsp;X&nbsp;");
		}
	
		/* 결제 팝업뜨게하고 최대한 비슷하게. */
		//동의합니다.
	}

	function chksubmit() {
		if (cnt == val && val != 0) {
			alert('좌석선택 완료.')

			document.seatfrm.cnt.value = cnt;
			document.seatfrm.seatnum.value = seat;
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
				onchange="selchg(${svo.scNum })" style="width: 100px;">
				<c:forEach begin="0" end="9" var="ii">
					<option>${ii }</option>
				</c:forEach>
			</select>
		</div>
	</div>
	<div id="S_top" style="width: 330px;">
		<img src="../resources/movposter/${svo.poster }" width="55px"
			style="margin-top: 10px; margin-right: 10px; float: left;" /> 
			<img src="../resources/imgs/
			<c:choose>
				<c:when test="${svo.grade ==18}">grade_18.png</c:when>
				<c:when test="${svo.grade ==15}">grade_15.png</c:when>
				<c:when test="${svo.grade ==12}">grade_12.png</c:when>
				<c:when test="${svo.grade == 0}">grade_0.png</c:when>
			</c:choose>
		"
			alt="이미지없음" width="18px" style="float: left; margin-top: 30px; margin-right: 5px;" />
		<div id="S_cho2" style="width: 60%; font-size: 17px; margin-top: 28px;">${svo.movtitle }</div>
	</div>
	<div id="S_top" style="width: 40%; float: left;">
		<div id="S_cho2" style="margin-top: 25px;">${svo.scNum }관</div>
		<div id="S_cho2" style="margin-top: 25px;">${svo.runtime}분</div>
		<div style="clear: both;"></div>
		<div id="S_cho2" style="font-size: 25px;">${svo.getDateDay() }</div>
		<div id="S_cho2" style="font-size: 25px;">${svo.mtime}</div>
	</div>
	<div style="clear: both;"></div>


	<hr style="margin-bottom: 100px;">


	<!-- 좌석선택 -->

	<div style="clear: both;"></div>

	<div style="margin-left: 25%;">

		<div
			style="width: 290px; background: gray; text-align: center; margin: 10px; margin-left: 70px;">SCREEN</div>

		<div style="clear: both;"></div>

		<c:forEach begin="1" end="4" var="col">

			<div class="S_seatcol">
				<c:choose>
					<c:when test="${col==1 }">
						<div class="S_seatcol">A</div>
					</c:when>
					<c:when test="${col==2 }">
						<div class="S_seatcol">B</div>
					</c:when>
					<c:when test="${col==3 }">
						<div class="S_seatcol">C</div>
					</c:when>
					<c:when test="${col==4 }">
						<div class="S_seatcol">D</div>
					</c:when>
					
				</c:choose>
			</div>
			
			<c:if test="${svo.scNum == 1 }">
			<c:forEach begin="1" end="10" var="no">
				<div class="S_<c:if test='${col==4 }'>royal</c:if>seat"
					id="S_seat${col }${no }" onclick="chkseat(${col},${no})" 
					style="  
						<c:if test="${no==5 ||no==6 }">
							pointer-events : none; color : white; border : solid 0px;
						</c:if>
					">
					${no }
				</div>
			</c:forEach>
			</c:if>
			
			<c:if test="${svo.scNum == 2 }">
			<c:forEach begin="1" end="10" var="no">
				<div class="S_<c:if test='${col==4 }'>royal</c:if>seat"
					id="S_seat${col }${no }" onclick="chkseat(${col},${no})">
					${no }
				</div>
			</c:forEach>
			</c:if>
			
			<c:if test="${svo.scNum == 3 }">
			<c:forEach begin="1" end="10" var="no">
				<div class="S_<c:if test='${col==4 }'>royal</c:if>seat"
					id="S_seat${col }${no }" onclick="chkseat(${col},${no})"
					style="  
						<c:if test="${no==3 ||no==8 }">
							pointer-events : none; color : white; border : solid 0px;
						</c:if>
					">
					${no }
				</div>
			</c:forEach>
			</c:if>
			
			<c:if test="${svo.scNum == 4 }">
			<c:forEach begin="1" end="10" var="no">
				<div class="S_<c:if test='${col==4 }'>royal</c:if>seat"
					id="S_seat${col }${no }" onclick="chkseat(${col},${no})"
					style="  
						<c:if test="${(col==1 || col==2)&&(no==9 ||no==10) }">
							pointer-events : none; color : white; border : solid 0px;
						</c:if>
					">
					${no }
				</div>
			</c:forEach>
			</c:if>
			
			<div style="clear: both;"></div>

		</c:forEach>

	</div>


	<hr style="margin-top: 100px;">



	<!-- 좌석 몇번인지 보여주는 임시창 -->

	<input type="hidden" name="seatnum" /> <input type="hidden" name="cnt" />
	<input type="hidden" name="price" />

	<div style="float: left; margin-left: 35%;">


		<div style="font-size: 20px; float: left;">좌석번호</div>
		<div id="S_seatnums"
			style="font-size: 20px; margin-left: 20px; float: left;"></div>

		<div style="clear: both;"></div>

		<div style="font-size: 20px; float: left;">결제금액</div>
		<div id="S_price"
			style="font-size: 20px; margin-left: 20px; float: left;"></div>

	</div>

	<div style="width: 80%;">
		<div id="S_btn" onclick="chksubmit()">결제</div>
	</div>
	<div style="clear: both;"></div>
</form>
