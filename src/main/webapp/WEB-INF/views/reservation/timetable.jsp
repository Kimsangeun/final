<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<style>
.S_dateset {
	float: left;
}
</style>

<c:set var="dateStr" value="" />
<c:set var="timeStr" value="" />
<c:set var="titleStr" value="" />
<c:set var="sidStr" value="" />
<c:set var="midStr" value="" />
<c:set var="dateListStr" value="" />

<c:forEach items="${dateTitleList}" var="dt" varStatus="no">
	<c:set var="dateStr" value="${dateStr }${dt.mdate }," />
	<c:set var="timeStr" value="${timeStr }${dt.mtime }," />
	<c:set var="titleStr" value="${titleStr }${dt.movtitle }," />
	<c:set var="sidStr" value="${sidStr }${dt.sId }," />
	<c:set var="midStr" value="${midStr }${dt.mId }," />
</c:forEach>

<c:forEach items="${datelist }" var="dd" varStatus="no">
	<c:set var="dateListStr" value="${dateListStr }${dd }," />
</c:forEach>

<script type="text/javascript">

var now = new Date(); 

var dddd = '${dateStr}';
var dateStr = dddd.split(',');
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

var nowtime = '${nowtime}';
var nowdate = '${nowdate}';

	$(document).ready(function(){
		for(var i = 0;i< dateListStr.length; i++){
			$('#S_dateset'+i).css("background","white")
		} 
	});

	function dateCheck(dd) {
		//alert(dd)
		for(var i = 0; i<dateStr.length; i++){
			$('#S_time'+i).css("color","black");
		}
		var dates = new Date();
	
		for(var i = 0; i < 14 ; i++){
			
			var clkdate = dd.split('-')[2];
			
			dates.setDate(now.getDate()+i)
			//alert(dates.getDate() == clkdate);
			 if(dates.getDate() == clkdate ){
				$('#S_dateset'+i).css("border","solid 2px");
			}else{
				$('#S_dateset'+i).css("border","solid 0px");
			} 
		}
		var lastT = '';
		
		var HH2 = nowtime.split(':')[0];
		HH2 = Number(HH2);
		var mm2 = nowtime.split(':')[1];
		mm2 = Number(mm2);
		
		for(var i = 0; i<dateStr.length; i++){
			
			if(dateStr[i]==dd){
			//alert(dateStr[i] +":"+dd)
				if(lastT == titleStr[i]){
					$('#S_title'+i).html(' ')
					//$('#S_title'+i).css("border-top" ,"solid 0px")
				}else{
					$('#S_title'+i).css("border-top" ,"solid 1px")
					$('#S_title'+i).html(titleStr[i])
				}
			//	alert(timeStr[i].split(':')[0]>nowtime.split(':'))
				$('#S_time'+i).html(timeStr[i])
				
				var HH1 = timeStr[i].split(':')[0];
				HH1 = Number(HH1);
				var mm1 = timeStr[i].split(':')[1];
				mm1 = Number(mm1);
				
				if(dd==nowdate){
					if(HH1<HH2){
						$('#S_time'+i).css("color","lightgray");
						$('#S_time'+i).css("pointer-events","none");
						if(mm1<mm2){
							$('#S_time'+i).css("color","lightgray");
						}
					}
				}
				
				
				lastT = titleStr[i];
			}else{
				$('#S_title'+i).css("border-top" ,"solid 0px")
				$('#S_title'+i).html(' ')
				$('#S_time'+i).html(' ')
				
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


<form name="screenchoiceForm" action="screenchoice">

	<hr>

	<%-- 
<c:forEach items="${dateTitleList }" var="dt" varStatus="no">
	${dt.mdate } ${dt.mtime}<br>
</c:forEach>
 --%>

	<!-- 날짜  -->

	<div  style="width: 100%; overflow-x: auto;">
		<c:forEach items="${datelist }" var="dd" varStatus="no">
			<button type="button" class="btn btn-secondary" class="S_dateset"
				id="S_dateset${no.index}" onclick="dateCheck('${dd}')" >
				<div>${dd.split('-')[1] }월</div>
				<div style="font-size: 20px;">${dd.split('-')[2] }일</div>
			</button>
		</c:forEach>
	</div>
	<div style="clear: both;"></div>

	<hr>

	<!-- 영화제목(장르 / 런타임/ 개봉일)  -->

	<c:forEach items="${dateTitleList }" varStatus="no">
		<div class="S_tt${no.index }">
			<div id="S_title${no.index }" style="font-size: 25px; cursor:pointer;"
				onclick="movieCheck(${no.index})"></div>

			<!-- 시간리스트(남은좌석수/ 상영관) -->

		<div id="S_time${no.index }" onclick="timeCheck(${no.index})" style="cursor:pointer; font-size: 20px;"></div>

		<div style="clear: both;"></div>
		</div>
	</c:forEach>

	<hr>

	<input type="hidden" name="sid" id="sid" value="sid" /> <input
		type="hidden" name="mid" id="mid" value="mid" /> <input type="hidden"
		name="title" id="title" value="title" />

</form>

