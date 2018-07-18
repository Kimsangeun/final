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
}
</style>

<c:set var="dateStr" value="" />
<c:set var="timeStr" value="" />
<c:set var="titleStr" value="" />
<c:set var="sidStr" value="" />
<c:set var="midStr" value="" />
<c:set var="dateListStr" value="" />
<c:set var="titleListStr" value="" />

<c:forEach items="${dateTitleList}" var="dt" varStatus="no" >
	<c:set var="dateStr" value="${dateStr }${dt.mdate },"/>
	<c:set var="timeStr" value="${timeStr }${dt.mtime },"/>
	<c:set var="titleStr" value="${titleStr }${dt.movtitle },"/>
	<c:set var="sidStr" value="${sidStr }${dt.sId },"/>
	<c:set var="midStr" value="${midStr }${dt.mId },"/>
</c:forEach>

<c:forEach items="${datelist }" var="dd" varStatus="no">
	<c:set var="dateListStr" value="${dateListStr }${dd },"/>
</c:forEach>

<c:forEach items="${titlelist }" var="tt" varStatus="no">
	<c:set var="titleListStr" value="${titleListStr }${tt.title },"/>
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

var tls = '${titleListStr}';
var titleListStr = tls.split(',');

	$(document).ready(function(){
		
		
	});
	
	var ttset = '';
   	var ssset = '';
	var mid = '';
	var clkdate ='';
	
   	function Check1(title, imgStr, mmid){
		//alert(mmid)
		//alert(clkdate)
		mid = mmid;
		ttset = '';
		ssset = '';
		
		$img = "<img src='../resources/movposter/"+imgStr+"' width='50px'/>";

		$('#S_movieimg').attr('img',$img);
		$('#S_movie').attr('title',title);
		
		$('#S_movieimg').html($('#S_movieimg').attr('img'));
		$('#S_movie').html($('#S_movie').attr('title'));
		
		document.getElementById("mid").value= mmid;
		
		document.getElementById("sid").value= '-1';
		$('#S_time').attr('mmm','시간선택');
		$('#S_time').html($('#S_time').attr('mmm'));
		
		/* for(var i = 0;i< dateStr.length; i++){
			$('#S_dateset'+j).css("color","black")
		} */
		
			for(var i = 0;i< dateStr.length; i++){
				
				if(midStr[i] == mid){
					if(dateStr[i] == clkdate){
						ttset += timeStr[i]+",";
						ssset += sidStr[i]+",";
					}
					/* for (var j = 0; j < dateListStr.length; j++) {	
						if(dateStr[i]==dateListStr[j]){
							
						}else{
							$('#S_dateset'+j).css("color","gray")
						}
					} */
				}
			}
		
		
		for (var i = 1; i < 20; i++) {
			
			var ttsp = ttset.split(',')[i-1];
			
			if(ttsp==null){
				$("#S_tim"+i).attr('tt',' ');
			}else{
				$("#S_tim"+i).attr('tt',ttsp);	
			}
			$("#S_tim"+i).html($("#S_tim"+i).attr('tt'));
		}
		
		for(var i = 0; i < titleListStr.length; i++){
			
			if(titleListStr[i] == title){
				$('#S_mov'+i).css("background","yellow");
			}else{
				$('#S_mov'+i).css("background","white");
			}
		}
		
	}
	
   	
	function Check2(ddate){
		//alert(mid)
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
				}
			}
		}
		//alert(ttset)
		
		for (var i = 1; i < 20; i++) {
			
			var ttsp = ttset.split(',')[i-1];
			
			if(ttsp==null){
				$("#S_tim"+i).attr('tt',' ');
			}else{
				$("#S_tim"+i).attr('tt',ttsp);	
			}
			$("#S_tim"+i).html($("#S_tim"+i).attr('tt'));
		}
		
		for(var i = 0; i < dateListStr.length; i++){
			if(dateListStr[i] == ddate){
				$('#S_dateset'+i).css("background","green")
			}else{
				$('#S_dateset'+i).css("background","white")
			}
		}

	}

	function Check3(no){
		
		$('#S_time').attr('mmm',ttset.split(',')[no-1]);
		$('#S_time').html($('#S_time').attr('mmm'));
		
		document.getElementById("sid").value= ssset.split(',')[no-1];
		
		for(var i=0;i<20;i++){
			if(i==no){
				$('#S_tim'+i).css("background","red")
			}else{
				$('#S_tim'+i).css("background","white")
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

	<div class="S_choice" style="overflow: auto;">
		<div id="S_mov">영화</div>

		<hr>

 		<c:forEach items="${titlelist }" var="mm" varStatus="no">
 		<div id="S_mov${no.index }"
				onclick="Check1('${mm.title }', '${mm.poster }', ${mm.mId }, ${no.index})">
			${mm.title }
		</div>
		</c:forEach>
	</div>

	<div class="S_choice" style="overflow: auto;">
		<div id="S_da">날짜</div>

		<hr>

		<div id="S_da">
			<!--날짜 -->

			<c:forEach items="${datelist }" var="dd" varStatus="no">
				<div class="S_dateset" id="S_dateset${no.index}"
					onclick="Check2('${dd}')">${dd }</div>
			</c:forEach>
			<div style="clear: both;"></div>

		</div>

		<div id="S_da"></div>
	</div>
	<div class="S_choice" style="overflow: auto;">
		<div id="S_tim">시간</div>
		<hr>
		
		<c:forEach begin="1" end="20" var="no">
			<div id="S_tim${no }" onclick="Check3(${no})"></div>
		</c:forEach>	
	</div>		
	<div style="clear: both"></div>

	<hr>

	<div id="S_movieimg" class="S_choice" >영화선택</div>
	<div id="S_movie" class="S_choice"></div> 
	<input type="text" name="mid" id="mid" value="-1">

	<div class="S_choice">></div>
	<div id="S_date" class="S_choice">날짜선택</div>
	<div class="S_choice">></div>
	<div id="S_time" class="S_choice">시간선택</div>
	<div class="S_choice">></div>
	<input type="text" name="sid" id="sid" value="-1">
	
	<div class="S_choice">
		<input type="button" value="좌석선택" onclick="Chk()" />
	</div>
	<div style="clear: both"></div>
</form>