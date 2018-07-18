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
	float : left;
}
.S_mov : focus{
	background : red;
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

<c:forEach items="${dateTitleList}" var="dt" varStatus="no" >
	<c:set var="scNumStr" value="${scNumStr }${dt.scNum },"/>
	<c:set var="dateStr" value="${dateStr}${dt.mdate},"/>
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
			
				if(midStr[i] == mid){
					if(dateStr[i] == clkdate){
						//alert(dateStr[i]+":"+clkdate)
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
			}
		titledate = titledate.split(',');
		
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
			$('#S_time'+i).css("background","white")
			$('.S_time'+i).css("border","solid 0px")
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
		
		for (var i = 1; i < 20; i++) {
			
			var ttsp = ttset.split(',')[i-1];
			var scsp = scset.split(',')[i-1];
			if(ttsp==null){
				$("#S_tim"+i).attr('tt',' ');
				$("#S_scNum"+i).attr('sc',' ');
			}else{
				$("#S_tim"+i).attr('tt',ttsp);	
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

	<div class="S_choice" >
		<div id="S_mov" align="center" ><h2>영화</h2></div>

		<hr>
		
		
<!-- <button type="button" class="btn btn-outline-primary">Primary</button>
<button type="button" class="btn btn-outline-secondary">Secondary</button>
<button type="button" class="btn btn-outline-success">Success</button>
<button type="button" class="btn btn-outline-info">Info</button>
<button type="button" class="btn btn-outline-warning">Warning</button>
<button type="button" class="btn btn-outline-danger">Danger</button>
 -->

		<div  class="btn-group-vertical"class="S_mov"  style="height : 300px; overflow: auto; width:100%;">
 		<c:forEach items="${titlelist }" var="mm" varStatus="no">
 		<input type="button" class="btn btn-secondary"  id="S_mov${no.index }"
				value="${mm.title }"
				 onclick="Check1('${mm.title }', '${mm.poster }', ${mm.mId }, ${no.index})">
		</c:forEach>
		</div>
	</div>

	<div class="S_choice" style="overflow: auto;">
		<div id="S_da" align="center"><h2>날짜</h2></div>

		<hr>

		<div id="S_da">
			<!--날짜 --> 
			<div  class="btn-group-vertical"  style="height : 300px; overflow: auto; width:100%;">
			<c:forEach items="${datelist }" var="dd" varStatus="no">
				<input type="button" class="btn btn-outline-secondary" id="S_dateset${no.index}"
					value="${dd } " 
					onclick="Check2('${dd}')">
			</c:forEach>
			</div>
			<div style="clear: both;"></div>

		</div>

		<div id="S_da"></div>
	</div>
	<div class="S_choice" style="overflow: auto;">
<<<<<<< HEAD
		<div id="S_tim" align="center"><h2>시간</h2></div>

=======
		<div id="S_tim">시간</div>
>>>>>>> branch 'master' of https://github.com/Kimsangeun/final.git
		<hr>
		<c:forEach begin="1" end="20" var="no">
		<div  class="S_time${no }"  onclick="Check3(${no})">
			<button type="button" class="btn btn-outline-secondary" style="background: white; width: 100%;"  align="center">
				<div id="S_tim${no }" align="center"></div>
				<div id="S_scNum${no }" align="center"></div>
			</button>
		</div>
		</c:forEach>
		</div>	
	<div style="clear: both"></div>

	<hr>

	<div class="S_cho" style="width: 20%;">
	<div id="S_movieimg" style="float: left;"></div>
	<div id="S_movie">영화선택</div> 
	</div>
	<input type="hidden" name="mid" id="mid" value="-1">

	<div class="S_cho" style="width: 3%;" >></div>
	<div class="S_cho" style="width: 10%;"  id="S_date" style="width: 15%;">날짜선택</div>
	<div class="S_cho" style="width: 3%;">></div>
	<div class="S_cho" style="width: 10%;">
	<div id="S_time" >시간선택</div>
	<div id="S_scNum"></div>
	</div>
	<div class="S_cho" style="width: 5%;" >></div>
	<input type="hidden" name="sid" id="sid" value="-1">	
	<div>
		<input class="btn btn-info" type="button" value="좌석선택" onclick="Chk()" />
	</div>
	<div style="clear: both"></div>
</form>	
	
	<c:if test="${param.mid != null}">
	    <c:forEach items="${titlelist }" var="mm" varStatus="no">
	        <c:if test="${param.mid eq mm.mId }">
	            <script>Check1('${mm.title }', '${mm.poster }', ${mm.mId} ,${no.index});</script>
	        </c:if>
	    </c:forEach>
	</c:if>