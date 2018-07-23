<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<!DOCTYPE html>

<style>
.S_choice {
	float: left;
	margin: 10px 0;
	width: 290px;
} 

.S_cho {
	height: 95%;
	float :left;
	color : #F6F6F6;
	 margin-left:20px;
}
#S_movieimg{
	width : 60px;
	float: left; 
	margin-top: 20px;
	margin-left: 10px;
}
#S_movie{
	width : 40%;
	font-size: 15px; 
	float: left; 
	margin-top: 50px; 
	margin-left: 15px; 
}
#S_date{
	width : 55%;
	font-size: 15px; 
	margin-top: 45px; 
}
#S_scNum{
	width : 55%;
	font-size: 15px; 
}
#S_time{
	width : 55%;
	font-size: 15px; 
}
.S_mov{
	font-size: 20px; 
	cursor: pointer; 
	padding: 10px 0;"
}
.S_mov:hover{
	background: #EAEAEA;
}

#S_btn{
	cursor: pointer; 
	margin-left:50px; 
	font-size:17px; 
	color:white; 
	background: red;
	margin-top: 30px; 
	padding:20px 10px; 
	text-align:center;  
	width: 120px; 
	float: left;
	border-radius: 3px;
}
#S_btn:hover{
	font-size:20px; 
	border: solid 5px red;
	margin-top: 25px; 
}
</style>

<c:set var="scNumStr" value="" />
<c:set var="dateStr" value="" />
<c:set var="timeStr" value="" />
<c:set var="titleStr" value="" />
<c:set var="sidStr" value="" />
<c:set var="midStr" value="" />

<c:set var="dateListStr" value="" />

<c:set var="titleListStr" value="" />

<c:set var="cntStr" value=""/>
<c:set var="rsidStr" value=""/>

<c:set var="cineScNumStr" value=""/>
<c:set var="totseatStr" value=""/>

<c:forEach items="${dateTitleList}" var="dt" varStatus="no">
	<c:set var="scNumStr" value="${scNumStr }${dt.scNum }," />
	<c:set var="dateStr" value="${dateStr}${dt.mdate}," />
	<c:set var="timeStr" value="${timeStr }${dt.mtime }," />
	<c:set var="titleStr" value="${titleStr }${dt.movtitle }," />
	<c:set var="sidStr" value="${sidStr }${dt.sId }," />
	<c:set var="midStr" value="${midStr }${dt.mId }," />
</c:forEach>

<c:forEach items="${datelist }" var="dd" varStatus="no">
	<c:set var="dateListStr" value="${dateListStr }${dd.split(':')[0] }," />
</c:forEach>

<c:forEach items="${titlelist }" var="tt" varStatus="no">
	<c:set var="titleListStr" value="${titleListStr }${tt.title }," />
</c:forEach>

<c:forEach items="${reserdata }" var="rr" varStatus="no">
	<c:set var="cntStr" value="${cntStr }${rr.cnt },"/>
	<c:set var="rsidStr" value="${rsidStr }${rr.sId },"/>
</c:forEach>

<c:forEach items="${cinemadata }" var="cc" varStatus="no">
	<c:set var="cineScNumStr" value="${cineScNumStr }${cc.scNum },"/>
	<c:set var="totseatStr" value="${totseatStr }${cc.totSeat },"/>
</c:forEach>

<script type="text/javascript">


var now = new Date(); 

var dddd = '${dateStr}';
var dateStr = dddd.split(',');

var sc = '${scNumStr}';
var scNumStr = sc.split(',');
var tttt = '${timeStr}';
var timeStr = tttt.split(',');
var ti = '${titleStr}';
var titleStr = ti.split(',');
var si = '${sidStr}';
var sidStr = si.split(',');
var mi = '${midStr}';
var midStr = mi.split(',');

var dls = '${dateListStr}';
var dateListStr = dls.split(',');

var tls = '${titleListStr}';
var titleListStr = tls.split(',');

var cc = '${cntStr}';
var cntStr = cc.split(',');
var rs = '${rsidStr}';
var rsidStr = rs.split(',');

var cn = '${cineScNumStr}';
var cineScNumStr = cn.split(',');
var to = '${totseatStr}';
var totseatStr = to.split(',');

var nowtime = '${nowtime}';
var nowdate = '${nowdate}';

var HH2 = nowtime.split(':')[0];
HH2 = Number(HH2);
var mm2 = nowtime.split(':')[1];
mm2 = Number(mm2);

	$(document).ready(function(){
	/* 	for(var i = 0; i < titleListStr.length; i++){
			$('#S_mov'+i).css("background","white");
		}
		for(var i = 0;i< dateListStr.length; i++){
			$('#S_dateset'+i).css("background","white")
		} 
		for(var i=1;i<20;i++){
			$('.S_tim'+i).css("background","white")
		} */
		for(var i = 0;i< dateListStr.length; i++){
			$('#S_dateset'+i).css('color','lightgray')
			.css('pointer-events','none');
		}
		
	});
	var scset = '';
	var ttset = '';
   	var ssset = '';
   	var ccset = '';
   	var toset = '';
   	
	var mid = '';
	var clkdate ='';
	var titledate = '';
	
   	function Check1(title, imgStr, mmid){

   		for(var i = 0;i< dateListStr.length; i++){
			$('#S_dateset'+i)
			.css('color','lightgray')
			.css('pointer-events','none');
		}
   		
		mid = mmid;
	
		ssset = '';
		titledate = '';
		
		$img = "<img src='../resources/movposter/"+imgStr+"' width='60px'/>";

		$('#S_movieimg').attr('img',$img)
						.html($('#S_movieimg').attr('img'));
		$('#S_movie').attr('title',title)
					.html($('#S_movie').attr('title'))
					.css('margin-top','30px');
		
		document.getElementById("mid").value= mmid;
		
		document.getElementById("sid").value= '-1';
		
		$('#S_time').html('시간선택');	
		$('#S_scNum').html('');
		$('#S_date').html('날짜선택');
		
		for(var i = 0;i< dateListStr.length; i++){
			$('#S_dateset'+i).css("color","lightgray")
							.css("border","solid 0px");
		} 
		
			for(var i = 0;i< dateStr.length; i++){

				//alert(dateStr[i]+":"+clkdate+":"+(dateStr[i] == clkdate))
				
				if(midStr[i] == mid){
					 for (var j = 0; j < dateListStr.length; j++) {	
						 if(dateStr[i] == dateListStr[j]){
							titledate += '#S_dateset'+j+",";
						}
					} 
				}
				//scset = scset.substring(0, scset.length-1);
				//ttset = ttset.substring(0, ttset.length-1);
			}
			
		titledate = titledate.split(',');

		for(var i = 0;i < titledate.length-1; i++){
			$(titledate[i])
						.css("color","black")
						.css('pointer-events','auto')
						.hover(
								function(){
									$(this).css('background','#EAEAEA');
								},
								function(){
									$(this).css('background','white');
								}
							);
		}
		
	 	for(var i = 0; i < titleListStr.length; i++){
			
			if(titleListStr[i] == title){
				$('#S_mov'+i).css("border","solid 2px gray" );
			}else{
				$('#S_mov'+i).css("border","solid 0px");
			}
		}
		 
		for(var i=1;i<20;i++){
			$("#S_tim"+i).html('');
			$("#S_scNum"+i).html('');
			$('#S_seat'+i).html('');
			
			$('.S_time'+i)
						.css("background","white")
						.css("border","solid 0px");
		}
	}
	
   	
	function Check2(ddate, day){
		//alert(mid)
		scset = '';
		ttset = '';
		ssset = '';
		toset = '';
		
		 clkdate = ddate;
		
		var YY=ddate.split('-')[0];
		var MM=ddate.split('-')[1];
		var dd=ddate.split('-')[2];
		 
		var emptyseat = 0;
		var tot = 0;
		
		$('#S_date').attr('dd',YY+'/'+MM+'/'+dd+' '+'('+day+')');
		$('#S_date').html('날짜&nbsp;&nbsp;&nbsp;' +$('#S_date').attr('dd'))
					.css('margin-top','30px');
		
		for(var i = 0;i< dateStr.length; i++){
			
			if(midStr[i] == mid){
				var cnt = 0;
				
				for(var j=0;j<cntStr.length;j++){
					if(rsidStr[j]==sidStr[i]){
						cnt += Number(cntStr[j]);
					}
				}
				
				for(var j=0;j<totseatStr.length;j++){
					if(cineScNumStr[j]==scNumStr[i]){
						tot = Number(totseatStr[j]);
						emptyseat = Number(totseatStr[j])-cnt;
					}
				}
					
				if(dateStr[i] == ddate){
					toset += emptyseat+"/"+tot+",";
					ttset += timeStr[i]+",";
					ssset += sidStr[i]+",";
					scset += scNumStr[i]+",";
				}
			}
		}
		//alert(ttset)
		
		for (var i = 0; i < 20; i++) {
			$("#S_tim"+i).attr('tt','');
			$("#S_scNum"+i).attr('sc','');
		}
		
		scset = scset.substring(0, scset.length-1);
		ttset = ttset.substring(0, ttset.length-1);
		toset = toset.substring(0, toset.length-1);
		
		
		for (var i = 1; i < 20; i++) {
			
			var ttsp = ttset.split(',')[i-1];
			var scsp = scset.split(',')[i-1];
			var tosp = toset.split(',')[i-1];
			
			if(ttsp==null || ttsp==''){
				$("#S_tim"+i).attr('tt','');
				$("#S_scNum"+i).attr('sc','');
				$("#S_seat"+i).attr('to','');
				$('#S_ti'+i)
				.css('margin','0px')
				.css('padding','0px');
				
			}else{
				$("#S_tim"+i).attr('tt',ttsp);	
				$('#S_ti'+i)
				.css('margin','5px')
				.css('padding','5px');
				
				var HH1 = ttsp.split(':')[0];
				HH1 = Number(HH1);
				var mm1 = ttsp.split(':')[1];
				mm1 = Number(mm1);
				
				
				if(ddate == nowdate){
					
					if(HH1<HH2){
						$('.S_time'+i)
								.css("color","#EAEAEA")
								.css("pointer-events","none");
					}else if(HH1=HH2){
						if(mm1<mm2){
							$('.S_time'+i)
										.css("color","#EAEAEA")
										.css("pointer-events","none");
						}
					}
				}else{
					$('.S_time'+i)
								.css("color","black")
								.css("pointer-events","auto")
								.hover(
										function(){
											$(this).css('background','#EAEAEA');
										},function(){
											$(this).css('background','white');
										}
									);
				}
				
				if(scsp != ''){
					$("#S_scNum"+i).attr('sc',scsp+'관')
								.css('color','#5D5D5D');
				}
				
				$("#S_seat"+i).attr('to',tosp)
							.css('color','#4374D9');
				
			}
			$("#S_tim"+i).html($("#S_tim"+i).attr('tt'));
			$("#S_scNum"+i).html($("#S_scNum"+i).attr('sc'));
			$("#S_seat"+i).html($("#S_seat"+i).attr('to'));
		
		}
		
		for(var i = 0; i < dateListStr.length; i++){
			
			if(dateListStr[i] == ddate){
				$('#S_dateset'+i).css("border","solid 2px gray")
			}else{
				$('#S_dateset'+i).css("border","solid 2px white")
			}
		}
		
		for(var i=0;i<10;i++){
			$('.S_time'+i).css("border","solid 2px white")
		}
	}

	function Check3(no){
		
		$('#S_time').attr('mmm',ttset.split(',')[no-1]);
		$('#S_time').html('시간&nbsp;&nbsp;&nbsp;'+$('#S_time').attr('mmm'));
		$('#S_scNum').attr('nnn',scset.split(',')[no-1]+'관');
		$('#S_scNum').html('상영관&nbsp;&nbsp;'+$('#S_scNum').attr('nnn'));
		
		document.getElementById("sid").value= ssset.split(',')[no-1];
		
		for(var i=1;i<20;i++){
			if(i==no ){
				$('.S_time'+i).css("border","solid 2px gray")
			}else{
				$('.S_time'+i).css("border","solid 2px white")
			}
		}
	} 
	
	function Chk(){
		if(document.getElementById("mid").value == -1){
			alert('영화를 선택해 주세요.')
		}else if(document.getElementById("sid").value == -1){
			alert('시간을 선택해 주세요.')
		}else{
			document.screenchoiceForm.submit();
		}
	}
	
</script>


<form name="screenchoiceForm" action="screenchoice" method="post">

	<!-- 영화  -->

	<div class="S_choice" style="margin-right: 50px;">
		<div align="center">
			<h2>영화</h2> 
		</div>

		<hr>

		<div style="height: 300px; overflow: auto; width: 100%;" align="center">
			<c:forEach items="${titlelist }" var="mm" varStatus="no">
				<div class="S_mov" id="S_mov${no.index }"
					onclick="Check1('${mm.title }', '${mm.poster }', ${mm.mId }, ${no.index})">
					<img src="../resources/imgs/
						<c:choose>
							<c:when test="${mm.grade ==18}">grade_18.png</c:when>
							<c:when test="${mm.grade ==15}">grade_15.png</c:when>
							<c:when test="${mm.grade ==12}">grade_12.png</c:when>
							<c:when test="${mm.grade == 0}">grade_0.png</c:when>
						</c:choose>
					 " alt="이미지없음" width="20px"/>
					${mm.title }
				</div>
			</c:forEach>
		</div>
	</div>



	<!--날짜 -->

	<div class="S_choice" style="overflow: auto; margin-right: 50px;">
		<div id="S_da" align="center">
			<h2>날짜</h2>
		</div>

		<hr>
		
		
		<div id="S_da">
			<div style="height: 300px; overflow: auto; width: 100%;"
				align="center">
				<c:forEach items="${datelist }" var="dd" varStatus="no">
					<div class="S_dateset" id="S_dateset${no.index}" onclick="Check2('${dd.split(':')[0]}','${dd.split(':')[1] }')"
						style="cursor: pointer; padding: 5px 0;">
						<div >${dd.split('-')[1] }월</div>
						<div style="width:60px; height: 25px; line-height: 25px;" align='center'>
							<div style="font-size: 25px; float: left;">${dd.split(':')[0].split('-')[2] }</div>
							<div style="font-size: 15px;">${dd.split(':')[1]}</div> 
						</div>
					
					</div>
				</c:forEach>
			</div>
			<div style="clear: both;"></div>

		</div>

	</div>



	<!-- 시간 -->

	<div class="S_choice" style="overflow: auto;">
		<div id="S_tim" align="center">
			<h2>시간</h2>
		</div>
		<hr>
		<c:forEach begin="1" end="20" var="no">
			<div class="S_time${no }" onclick="Check3(${no})"
				style="float: left;cursor: pointer;margin-left: 5px;" align="center">
				<div id="S_ti${no }">
					<div id="S_scNum${no }"></div>
					<div id="S_tim${no }" style="font-size: 22px;"></div>
					<div id="S_seat${no }"></div>
				</div>
			</div>
			<c:if test="${no%3==0 }">
				<div style="clear: both"></div>
			</c:if>
		</c:forEach>
	</div>
	<div style="clear: both"></div>


	<hr>


	<!-- 선택된 값 -->
	<div style="background: #353535; height: 130px; width: 90%;">
		<div class="S_cho" style="padding : 0 30px; width :35%;" >   
			<div id="S_movieimg"></div>
			<div id="S_movie">영화선택</div>
		</div>

		<input type="hidden" name="mid" id="mid" value="-1">

		<div class="S_cho" style="width : 30%;  margin-left:20px;"> 
			<div id="S_date">날짜선택</div>
			<div id="S_time">시간선택</div>
			<div id="S_scNum"></div>
		</div>
		
		<input type="hidden" name="sid" id="sid" value="-1">
		<div class="S_cho" style="margin-left: 50px; overflow: a">
		<div onclick="Chk()"
			id="S_btn" >좌석선택</div>
		</div>
		<div style="clear: both"></div>
	</div>
</form>

<c:if test="${param.mid != null}">
	<c:forEach items="${titlelist }" var="mm" varStatus="no">
		<c:if test="${param.mid eq mm.mId }">
			<script>Check1('${mm.title }', '${mm.poster }', ${mm.mId} ,${no.index})</script>
		</c:if>
	</c:forEach>
</c:if>