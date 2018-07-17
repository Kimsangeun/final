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
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>

<c:set var="dateStr" value=" " />
<c:set var="midStr" value=" " />
<c:forEach items="${datedata }" var="dd" varStatus="no">
	
	<c:set var="dateStr" value="${dateStr}${dd.mstartStr } ${dd.sId }" />
	<c:set var="midStr" value="${midStr}${dd.mId }," />
	
	<c:if test="${datedata.size() > no.index+1 }">
		<c:set var="dateStr" value="${dateStr }," />
	</c:if>

</c:forEach>


<script type="text/javascript">

var dddd = '${dateStr}';
var dateStr = dddd.split(',');

var mmmm = '${midStr}';
var midStr = mmmm.split(',');

	$(document).ready(function(){
		var now = new Date(); 
		
		for (var i = 0; i < 15; i++) {
			var dates = new Date(now.getYear(), now.getMonth(), now.getDate()+i-1).getDate();
		
			$('#S_ddd'+i).attr('ddd',dates);
			$('#S_ddd'+i).html($('#S_ddd'+i).attr('ddd'));
		}
	});
	
	
   	function Check1(title, imgStr, mmid){
		//alert(mmid)
		
		$img = "<img src='../resources/movimg/"+imgStr+"'/>";

		$('#S_movieimg').attr('img',$img);
		$('#S_movie').attr('title',title);
		
		$('#S_movieimg').html($('#S_movieimg').attr('img'));
		$('#S_movie').html($('#S_movie').attr('title'));
		
		document.getElementById("mid").value= mmid;
		var now = new Date(); 
		for(var j=0; j<midStr.length;j++){
		//	alert("mid : "+midStr[j]+"mmid : "+mmid+(midStr[j]==mmid))
		
		}
		
		/* 
		for(var j=0; j<midStr.length;j++){
			if(midStr[j] == mmid){
				alert(dateStr[j])
			}	
		} */
		for (var i = 0; i < 15; i++) {
			var dates = new Date(now.getYear(), now.getMonth(), now.getDate()+i-1).getDate();
		
			/* for(var j=0; j<midStr.length;j++){
				if(midStr[j] == mmid){
					$('#S_dddd'+i).css("color","black");
				}else{
					$('#S_dddd'+i).css("color","lightgray");
				}	
			} */
			$('#S_ddd'+i).attr('ddd',dates);
			$('#S_ddd'+i).html($('#S_ddd'+i).attr('ddd'));
		}
	}
	
   	
   	var ttset = '';
   	var ssset = '';
	function Check2(no){

		var myData= new Date();
		
		var myDate = new Date(myData.getYear(),myData.getMonth(),myData.getDate()+no-1);
		
		var res = (myDate.getYear()+3800)+"-"+(myDate.getMonth()+1)+"-"+myDate.getDate();
		
		$('#S_date').attr('dd',res);
		$('#S_date').html($('#S_date').attr('dd'));

		ttset = '';
		
		for (var i = 0; i < dateStr.length; i++) {
			
			var ss = dateStr[i].trim();
			
			var dateset = ss.split(' ')[0];
			var timeset = ss.split(' ')[1];
			var sIdset = ss.split(' ')[2];
			
			if(res == dateset){
				
				ttset += timeset+",";
				ssset += sIdset+",";
				
			}
		}
		
		for (var i = 1; i < 20; i++) {
			
			var ttsp = ttset.split(',')[i-1];
			//alert(ttsp);
			
			if(ttsp==null){
				$("#S_ttt"+i).attr('tt',' ');
			}else{
				$("#S_ttt"+i).attr('tt',ttsp);	
			}
			$("#S_ttt"+i).html($("#S_ttt"+i).attr('tt'));
		}
		
		alert(ttset);
	
	}

	function Check3(no){
		//alert(ttset)
		//alert(ssset.split(',')[no-1]);
		$('#S_time').attr('mmm',ttset.split(',')[no-1]);
		$('#S_time').html($('#S_time').attr('mmm'));
		
		document.getElementById("sid").value= ssset.split(',')[no-1];
	}
	
</script>


<form action="screenchoice" method="post">

	<div class="S_choice" style="overflow: auto;">
		<div id="S_mov">영화</div>

		<hr>

 		<c:forEach items="${moviedata }" var="mm" varStatus="no">
 		<div id="S_mov"
				onclick="Check1('${mm.title }', '${mm.image }', ${mm.mId })">
			${mm.title }
		</div>
		</c:forEach>
	</div>

	<div class="S_choice" style="overflow: auto;">
		<div id="S_da">날짜</div>

		<hr>

		<div id="S_da">
			<!--날짜 -->

			<c:forEach begin="1" end="14" var="no">
			
				<div id="S_dddd${no }">
				<div id="S_ddd${no }" style="float: left" onclick="Check2(${no})"></div>일
				</div>
				<div style="clear: both;"></div>
				
			</c:forEach>

		</div>

		<div id="S_da"></div>
	</div>
	<div class="S_choice" style="overflow: auto;">
		<div id="S_tim">시간</div>

		<hr>

		<%-- 	
			<c:forEach items="${datedata}" var="dd" varStatus="no">
				<div id="time_${no.index }" onclick="Check3(${dd.sId},'${dd.mstartTimeStr}')">
					<fmt:formatDate value="${dd.mstart }" pattern="HH:mm" />
					${dd.mstartTimeStr}<br>
				</div>
			</c:forEach> 
		--%>
		
		<c:forEach begin="1" end="20" var="no">
			<div id="S_ttt${no }" onclick="Check3(${no})"></div>
		</c:forEach>	
	</div>		
	<div style="clear: both"></div>

	<hr>

	<div id="S_movieimg" class="S_choice">영화선택</div>
	<div id="S_movie" class="S_choice"></div>
	<input type="hidden" name="mid" id="mid" value="">

	<div class="S_choice">></div>
	<div id="S_date" class="S_choice">날짜선택</div>
	<div class="S_choice">></div>
	<div id="S_time" class="S_choice">시간선택</div>
	<div class="S_choice">></div>
	<input type="hidden" name="sid" id="sid" value="">
	
	<div class="S_choice">
		<input type="submit" value="확인" />
	</div>
	<div style="clear: both"></div>
</form>