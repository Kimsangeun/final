<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<style>
.S_dateset{
float: left;
border: solid 1px;
}

</style>

<c:set var="dateStr" value="" />
<c:set var="timeStr" value="" />
<c:set var="titleStr" value="" />
<c:set var="sidStr" value="" />

<c:forEach items="${dateTitleList}" var="dt" varStatus="no" >
	<c:set var="dateStr" value="${dateStr }${dt.mdate },"/>
	<c:set var="timeStr" value="${timeStr }${dt.mtime },"/>
	<c:set var="titleStr" value="${titleStr }${dt.movtitle },"/>
	<c:set var="sidStr" value="${sidStr }${dt.sId },"/>
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

	$(document).ready(function(){
		
		$('#S_dateset0').css("border","solid 5px");
		
	});

	function dateCheck(dd) {
		
		
		var dates = new Date();
	
		for(var i = 0; i < 14 ; i++){
			
			var clkdate = dd.split('-')[2];
			
			dates.setDate(now.getDate()+i)
			//alert(dates.getDate() == clkdate);
			 if(dates.getDate() == clkdate ){
				$('#S_dateset'+i).css("border","solid 5px");
			}else{
				$('#S_dateset'+i).css("border","solid 1px");
			} 
		}
		
		for(var i = 0; i<dateStr.length; i++){
		
			if(dateStr[i]==dd){
				//alert('#S_title'+cnt)
				$('#S_title'+i).html(titleStr[i])
				$('#S_time'+i).html(timeStr[i])
				$('.S_tt'+i).css("border" ,"solid 1px")
				
			}else{
				
				$('#S_title'+i).html(' ')
				$('#S_time'+i).html(' ')
				
				$('.S_tt'+i).css("border" ,"solid 0px")
			}
			
		}
		
		/* for(var i = cnt; i< 10; i++){
			$('#S_title'+i).html(' ')
			$('#S_time'+i).html(' ')
		}  */
	
	
	}
	
	function timeCheck(no){
		
		alert(sidStr[no])
		document.getElementById('sid').value = sidStr[no];
		
	}
	

</script>


<form action="">


<hr>
<%-- 
<c:forEach items="${dateTitleList }" var="dt" varStatus="no">
	${dt.mdate } ${dt.mtime}<br>
</c:forEach>
 --%>

<!-- 날짜  -->
<c:forEach items="${datelist }" var="dd" varStatus="no">
<div class="S_dateset" id="S_dateset${no.index}" onclick="dateCheck('${dd}')" >
	${dd }
</div>
</c:forEach>
<div style="clear: both;"></div>

<hr>

<!-- 영화제목(장르 / 런타임/ 개봉일)  -->
<c:forEach items="${dateTitleList }" varStatus="no">
<div class="S_tt${no.index }" onclick="timeCheck(${no.index})">
	<div id="S_title${no.index }"></div>
<!-- 시간리스트(남은좌석수/ 상영관) -->
	<div id="S_time${no.index }"></div>
</div>
</c:forEach>

<hr>



<input type="text" name="sid" id="sid" value=""/>

</form>


