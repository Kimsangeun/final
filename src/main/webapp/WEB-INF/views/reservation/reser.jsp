<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<!DOCTYPE html>

<style>
.S_choice {
	float: left;
	margin-left: 20px;
	width: 25%;
}

.S_cho {
	float: left;
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
<script type="text/javascript">

var now = new Date(); 

var dddd = '${dateStr}';
var dateStr = dddd.split(',');

var YYYYStr = '';
var MMStr = '';
var ddStr = '';
var EStr = '';
/* 
for(var i=0; i<dateStr.length-1;i++){
	
	YYYYStr += dateStr[i].split('-')[0]+",";
	MMStr += dateStr[i].split('-')[1]+",";
	ddStr += dateStr[i].split('-')[2]+",";
	
}

YYYYStr = YYYYStr.split(',');
MMStr = MMStr.split(',');
ddStr = ddStr.split(',');
 */

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

var nowtime = '${nowtime}';
var nowdate = '${nowdate}';

var HH2 = nowtime.split(':')[0];
HH2 = Number(HH2);
var mm2 = nowtime.split(':')[1];
mm2 = Number(mm2);

	$(document).ready(function(){
		for(var i = 0; i < titleListStr.length; i++){
			$('#S_mov'+i).css("background","white");
		}
		for(var i = 0;i< dateListStr.length; i++){
			$('#S_dateset'+i).css("background","white")
		} 
		for(var i=1;i<20;i++){
			$('.S_tim'+i).css("background","white")
		}
	});
	
	var scset = '';
	var ttset = '';
   	var ssset = '';
	var mid = '';
	var clkdate ='';
	var titledate = '';
	
   	function Check1(title, imgStr, mmid){

		mid = mmid;
		scset = '';
		ttset = '';
		ssset = '';
		titledate = '';
		
		$img = "<img src='../resources/movposter/"+imgStr+"' width='50px'/>";

		$('#S_movieimg').attr('img',$img);
		$('#S_movie').attr('title',title);
		
		$('#S_movieimg').html($('#S_movieimg').attr('img'));
		$('#S_movie').html($('#S_movie').attr('title'));
		
		document.getElementById("mid").value= mmid;
		
		document.getElementById("sid").value= '-1';
		
		$('#S_time').attr('mmm','시간선택');
		$('#S_time').html($('#S_time').attr('mmm'));	
		$('#S_scNum').attr('nnn','' );
		$('#S_scNum').html($('#S_scNum').attr('nnn'));
		
		for(var i = 0;i< dateListStr.length; i++){
			$('#S_dateset'+i).css("color","lightgray")
		} 
		
			for(var i = 0;i< dateStr.length; i++){

				//alert(dateStr[i]+":"+clkdate+":"+(dateStr[i] == clkdate))
				
				if(midStr[i] == mid){
					if(dateStr[i] == clkdate){
						ttset += timeStr[i]+",";
						ssset += sidStr[i]+",";
						scset += scNumStr[i]+",";
					}
					 for (var j = 0; j < dateListStr.length; j++) {	
						 if(dateStr[i] == dateListStr[j]){
							titledate += '#S_dateset'+j+",";
						}
					} 
				}
				scset = scset.substring(0, scset.length-1);
				ttset = ttset.substring(0, ttset.length-1);
			}
		titledate = titledate.split(',');
		//alert(dateStr)
		//alert(dateListStr)
		for(var i = 0;i < titledate.length; i++){
			$(titledate[i]).css("color","black");
		}
		
		
		for (var i = 1; i < 20; i++) {
			
			var ttsp = ttset.split(',')[i-1];
			var scsp = scset.split(',')[i-1];
			
			
			if(ttsp==null){
				$("#S_tim"+i).attr('tt',' ');
				$("#S_scNum"+i).attr('sc',' ');
			}else{
				$("#S_tim"+i).attr('tt',ttsp);	
				if(scsp != ''){
					$("#S_scNum"+i).attr('sc',scsp+'관');
				}
			}
			$("#S_tim"+i).html($("#S_tim"+i).attr('tt'));
			$("#S_scNum"+i).html($("#S_scNum"+i).attr('sc'));
		}
		
	 	for(var i = 0; i < titleListStr.length; i++){
			
			if(titleListStr[i] == title){
				$('#S_mov'+i).css("border","solid 2px gray" );
			}else{
				$('#S_mov'+i).css("border","solid 0px");
			}
		}
		 
		for(var i=1;i<20;i++){
			$('.S_time'+i).css("background","white")
			$('.S_time'+i).css("border","solid 0px")
			
			if(clkdate == nowdate){
				if(HH1<HH2){
					$('.S_time'+i).css("color","lightgray");
					$('.S_time'+i).css("pointer-events","none");
				}else if(HH1=HH2){
					if(mm1<mm2){
						$('.S_time'+i).css("color","lightgray");
						$('.S_time'+i).css("pointer-events","none");
					}
				}
			}else{
				$('.S_time'+i).css("color","black");
				$('.S_time'+i).css("pointer-events","auto");
			}
			
			
		}
	}
	
   	
	function Check2(ddate){
		//alert(mid)
		scset = '';
		ttset = '';
		ssset = '';
		clkdate = ddate;
		$('#S_date').attr('dd',ddate);
		$('#S_date').html($('#S_date').attr('dd'));
		
		for(var i = 0;i< dateStr.length; i++){
			
			if(midStr[i] == mid){
				if(dateStr[i] == ddate){
					ttset += timeStr[i]+",";
					ssset += sidStr[i]+",";
					scset += scNumStr[i]+",";
				}
			}
		}
		//alert(ttset)
		
		
		
		scset = scset.substring(0, scset.length-1);
		ttset = ttset.substring(0, ttset.length-1);
		
		for (var i = 1; i < 20; i++) {
			
			var ttsp = ttset.split(',')[i-1];
			var scsp = scset.split(',')[i-1];
			
			if(ttsp==null){
				$("#S_tim"+i).attr('tt',' ');
				$("#S_scNum"+i).attr('sc',' ');
			}else{
				$("#S_tim"+i).attr('tt',ttsp);	
				
				var HH1 = ttsp.split(':')[0];
				HH1 = Number(HH1);
				var mm1 = ttsp.split(':')[1];
				mm1 = Number(mm1);
				
				
				if(ddate == nowdate){
					
					if(HH1<HH2){
						$('.S_time'+i).css("color","lightgray");
						$('.S_time'+i).css("pointer-events","none");
					}else if(HH1=HH2){
						if(mm1<mm2){
							$('.S_time'+i).css("color","lightgray");
							$('.S_time'+i).css("pointer-events","none");
						}
					}
				}else{
					$('.S_time'+i).css("color","black");
					$('.S_time'+i).css("pointer-events","auto");
				}
				
				if(scsp != ' '){
					$("#S_scNum"+i).attr('sc',scsp+'관');
				}
			}
			$("#S_tim"+i).html($("#S_tim"+i).attr('tt'));
			$("#S_scNum"+i).html($("#S_scNum"+i).attr('sc'));
		
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
		$('#S_time').html($('#S_time').attr('mmm'));
		$('#S_scNum').attr('nnn',scset.split(',')[no-1]+'관');
		$('#S_scNum').html($('#S_scNum').attr('nnn'));
		
		document.getElementById("sid").value= ssset.split(',')[no-1];
		
		for(var i=1;i<20;i++){
			if(i==no ){
				$('.S_time'+i).css("border","solid 2px gray")
			}else{
				$('.S_time'+i).css("border","solid 0px")
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
		<div id="S_mov" align="center">
			<h2>영화</h2>
		</div>

		<hr>

		<div class="S_mov" style="height: 300px; overflow: auto; width: 100%;"
			align="center">
			<c:forEach items="${titlelist }" var="mm" varStatus="no">
				<div id="S_mov${no.index }"
					style="font-size: 20px; cursor: pointer; padding: 10px 0;"
					onclick="Check1('${mm.title }', '${mm.poster }', ${mm.mId }, ${no.index})">
					
					<img src="../resources/imgs/
						<c:choose>
							<c:when test="${mm.grade ==18}">movie_icon_18.gif</c:when>
							<c:when test="${mm.grade ==15}">movie_icon_15.gif</c:when>
							<c:when test="${mm.grade ==12}">movie_icon_12.gif</c:when>
							<c:when test="${mm.grade == 0}">movie_icon_0.gif</c:when>
						</c:choose>
					 " alt="이미지없음" width="25px;"/>
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
					<div id="S_dateset${no.index}" onclick="Check2('${dd.split(':')[0]}')"
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
				style="float: left;"">
				<div style="padding: 5px; margin: 5px; cursor: pointer;"
					align="center">
					<div id="S_scNum${no }" align="center"></div>
					<div id="S_tim${no }" align="center" style="font-size: 25px;"></div>
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
	<div style="background: lightgray; width: 100%; padding: 40px 0;">
		<div class="S_cho" style="margin-left: 5%;">
			<div id="S_movieimg" style="float: left; margin-right: 5%;">&nbsp;&nbsp;&nbsp;&nbsp;</div>
			<div id="S_movie" style="width: 250px; font-size: 18px;">영화선택</div>
		</div>

		<input type="hidden" name="mid" id="mid" value="-1">

		<div class="S_cho"
			style="padding: 40px 0; border-right: solid 3px gray;"></div>
		<div class="S_cho" id="S_date" style="margin: 0 5%; font-size: 18px;">날짜선택</div>
		<div class="S_cho"
			style="padding: 40px 0; border-right: solid 3px gray;"></div>
		<div class="S_cho" style="margin: 0 5%;" align="center">
			<div id="S_scNum" style="font-size: 18px;">시간선택</div>
			<div id="S_time" style="font-size: 18px;"></div>
		</div>
		<div class="S_cho"
			style="padding: 40px 0; border-right: solid 3px gray;"></div>

		<input type="hidden" name="sid" id="sid" value="-1">

		<div onclick="Chk()"
			style="cursor: pointer; background: red; width: 50px;">좌석선택</div>
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