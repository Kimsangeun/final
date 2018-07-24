<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<style>
.S_dateset {
	float: left;
}

.S_time{
	cursor: pointer; 
	font-size: 17px; 	border-radius: 2px;
	text-align: center;
	
}
.S_time:hover{
	border : solid 2px lightgray;
	background-color: #4C4C4C;
	color: white;
}
</style>

<c:set var="scNumStr" value="" />
<c:set var="dateStr" value="" />
<c:set var="timeStr" value="" />
<c:set var="titleStr" value="" />
<c:set var="sidStr" value="" />
<c:set var="midStr" value="" />
<c:set var="gradeStr" value="" />

<c:set var="dateListStr" value="" />

<c:set var="cntStr" value=""/>
<c:set var="rsidStr" value=""/>

<c:set var="cineScNumStr" value=""/>
<c:set var="totseatStr" value=""/>

<c:forEach items="${dateTitleList}" var="dt" varStatus="no">
	<c:set var="scNumStr" value="${scNumStr }${dt.scNum }," />
	<c:set var="dateStr" value="${dateStr }${dt.mdate }," />
	<c:set var="timeStr" value="${timeStr }${dt.mtime }," />
	<c:set var="titleStr" value="${titleStr }${dt.movtitle }," />
	<c:set var="sidStr" value="${sidStr }${dt.sId }," />
	<c:set var="midStr" value="${midStr }${dt.mId }," />
	<c:set var="gradeStr" value="${gradeStr }${dt.grade}," />
</c:forEach>

<c:forEach items="${datelist }" var="dd" varStatus="no">
	<c:set var="dateListStr" value="${dateListStr }${dd.split(':')[0] }," />
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
var gg = '${gradeStr}';
var gradeStr = gg.split(',');

var dls = '${dateListStr}';
var dateListStr = dls.split(',');


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
		for(var i = 0;i< dateListStr.length; i++){
			$('#S_dateset'+i).css("background","white")
		} 
		
		for (var i = 0; i < gradeStr.length; i++) {
			switch(gradeStr[i]){
			case '18':
				gradeStr[i] = "<img src='../resources/imgs/grade_18.png' width='17px'/> "
				break;			
			case '15':
				gradeStr[i] = "<img src='../resources/imgs/grade_15.png' width='17px'/> "
				break;
			case '12':
				gradeStr[i] = "<img src='../resources/imgs/grade_12.png' width='17px'/> "
				break;			
			case '0':
				gradeStr[i] = "<img src='../resources/imgs/grade_0.png' width='17px'/> "
				break;
			}
		}
	});
	
	function dateCheck(dd) {
		
		for(var i = 0; i<dateStr.length; i++){
			$('#S_gradeimg'+i).html('');
			$('#S_scNum'+i).html('');
			$('#S_seat'+i).html('');
			
		}
		
		var clkdate = Number(dd.split('-')[2]);
	
		for(var i = 0; i < 14 ; i++){
			
			//dates.setDate(now.getDate()+i);
			var dates = new Date();
			dates.setDate(dates.getDate()+i);
	
			if(dates.getDate() == clkdate ){
				//alert('dates.getDate() : '+dates.getDate());
				$('#S_dateset'+i).css("border","solid 2px gray");
			}else{
				$('#S_dateset'+i).css("border","solid 2px white");
			} 
		}
		for(var i = 0; i<dateStr.length; i++){
			$('#S_tit'+i).css('padding','0px')
						.css('margin','0px');
			$('#S_time'+i).css('padding','0px')
						.css('margin','0px')
						.css('border','solid 0px');
			$('#S_scNum'+i).css('margin','0px');
			$('#S_seat'+i).css('margin','0px');
			$('#S_hr'+i).html('');
			$('#S_bor'+i).css('border','solid 0px');
		}
		
		var lastT = '';
		
		var emptyseat = 0;
		var tot = 0;
	
		for(var i = 0; i<dateStr.length; i++){
			if(i != dateStr.length){
				//alert('titleStr[i]:'+titleStr[i] )
				//alert('titleStr[i+1]:'+titleStr[i+1])
				if(titleStr[i] != titleStr[i+1]){
					$('#S_clear'+i).css('clear','both');
				}
			}
			if(dateStr[i]==dd){
			//alert(dateStr[i] +":"+dd)
				if(lastT == titleStr[i]){
					$('#S_title'+i).html('');
					$('#S_gradeimg'+i).html('');
					//$('#S_title'+i).css("border-top" ,"solid 0px")
				}else{
					$('#S_gradeimg'+i).html(gradeStr[i]);
					$('#S_title'+i).html(titleStr[i]);
					$('#S_hr'+i).html("<hr>");
					lastT = titleStr[i];
				}

				
				var cnt = 0;
				
				for(var j=0;j<cntStr.length;j++){
					if(rsidStr[j]==sidStr[i]){
						cnt += Number(cntStr[j]);
					}
				}
			//	alert('cnt:'+cnt);
				
				for(var j=0;j<totseatStr.length;j++){
					if(scNumStr[i]==cineScNumStr[j]){
						tot = Number(totseatStr[j]);
						emptyseat = Number(totseatStr[j])-cnt; 
					}
				}
				
				$('#S_seat'+i).html(emptyseat+"/"+tot+"석");
				$('#S_seat'+i)
							.css('margin','4px 0')
							.css('width','60px')
							.css('color','#4374D9');
				$('#S_scNum'+i).html(scNumStr[i]+'관');
				$('#S_scNum'+i)
							.css('margin','4px 0')
							.css('width','25px');
				$('#S_time'+i).html(timeStr[i]);
				$('#S_time'+i)
							.css('margin','0 6px')
							.css('width','57px');
				$('#S_bor'+i).css('border','solid 1px gray');
				$('#S_tit'+i).css('margin-bottom','10px');
				var HH1 = timeStr[i].split(':')[0];
				HH1 = Number(HH1);
				var mm1 = timeStr[i].split(':')[1];
				mm1 = Number(mm1);
				
				if(dd==nowdate){
				//	alert('hh1:'+HH1)
				//	alert('hh2:'+HH2)
					if(HH1<HH2){
						$('#S_time'+i).css("color","lightgray");
						$('#S_time'+i).css("pointer-events","none");
						$('#S_seat'+i).html('마감');
					}else if(HH1==HH2){
						if(mm1<mm2){
							$('#S_time'+i).css("color","lightgray");
							$('#S_time'+i).css("pointer-events","none");
							$('#S_seat'+i).html('마감');
						
						}
					}
				}
				
			}else{
				$('#S_title'+i).css("border-top" ,"solid 0px")
				$('#S_title'+i).html('')
				$('#S_time'+i).html('')	
			}	
		}
	}
	
	function timeCheck(no){
		//alert(sidStr[no]+":"+midStr[no])
		
		document.getElementById('sid').value = sidStr[no];
		document.getElementById('mid').value = midStr[no];
		
		document.screenchoiceForm.submit();
	}
	
	function movieCheck(no){
		document.getElementById('mid').value = midStr[no];
		document.getElementById('title').value = titleStr[no];
		
	}
	
</script>
<div><h2>상영시간표</h2></div>

<hr>


<form name="screenchoiceForm" action="screenchoice">

	<hr style="height: 3px; background:gray;">

	<%-- 
<c:forEach items="${dateTitleList }" var="dt" varStatus="no">
	${dt.mdate } ${dt.mtime}<br>
</c:forEach>
 --%>

	<!-- 날짜  -->

	<div style="width: 100%; height : 65px; overflow: auto; ">
		<c:forEach items="${datelist }" var="dd" varStatus="no">
			<div class="S_dateset" id="S_dateset${no.index}" style="padding: 5px; margin:0 5px; cursor: pointer; border : solid 2px white;"
				onclick="dateCheck('${dd.split(':')[0]}')" align="center">
				<div>${dd.split('-')[1] }월 (${dd.split(':')[1]})</div>
				<div style="font-size: 20px;">${dd.split(':')[0].split('-')[2] }</div>
			</div>
		</c:forEach>
	</div>
	
	<div style="clear: both;"></div>

	<hr style="height: 3px; background: gray;"> 

	<!-- 영화제목(장르 / 런타임/ 개봉일)  -->

	<div style="height: 500px; overflow: auto;">
	<c:forEach items="${dateTitleList }" varStatus="no">
		<%-- <div class="S_tt${no.index }"  style="float:left;"> --%>
		<div id="S_hr${no.index }"></div>
		<div id="S_tit${no.index }" >
			<div id="S_gradeimg${no.index }" style="float:left; width: 20px;"></div>
			<div id="S_title${no.index }"
				style="font-size: 20px; cursor: pointer; width:300px;" 
				onclick="movieCheck(${no.index})" ></div>
		</div>
		<div id="S_hr${no.index }"></div>
			<!-- 시간리스트(남은좌석수/ 상영관) -->
			<div id="S_bor${no.index }" style="float: left;" align="center">
			<div class="S_time" id="S_time${no.index }" onclick="timeCheck(${no.index})" ></div>
			<div class="S_scNum" id="S_scNum${no.index }" style="float:left; font-size: 13px;"></div>
			<div class="S_seat" id="S_seat${no.index }" style="float:left; font-size: 13px;"></div>
			</div>
			<div id="S_clear${no.index }"></div>
		<!-- </div> -->
		
		
	</c:forEach>
	</div>
	
	<div style="clear : both;"></div>
	
	<hr>

	<input type="hidden" name="sid" id="sid" value="sid" /> 
	<input type="hidden" name="mid" id="mid" value="mid" />
	<input type="hidden" name="title" id="title" value="title" />

</form>

