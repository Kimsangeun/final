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
<c:forEach items="${datedata }" var="dd" varStatus="no">

	<c:set var="dateStr" value="${dateStr}${dd.mstartStr }" />

	<c:if test="${datedata.size() > no.index+1 }">
		<c:set var="dateStr" value="${dateStr }," />
	</c:if>

</c:forEach>


<script type="text/javascript">

var dddd = '${dateStr}';
var dateStr = dddd.split(',');

//alert(dateStr[0]);
/* 	$(document).ready(function() {
		$('.S_cho').find('#S_mov').each(function(i, e) {
			var bb = "#bb" + i;
			$(bb).toggle(function() {
				alert(bb + "누름.");

				$(e).css("color", "yellow");
			}, function() {
				alert(bb + "또누름..");
				$(e).css("color", "red");
			});
		})
	}); */
	
//	var dateArr = [];
	
	$(document).ready(function(){
		var now = new Date(); 
		
		for (var i = 0; i < 15; i++) {
			var dddd = new Date(now.getYear(), now.getMonth(), now.getDate()+i-1).getDate();
		
			$('#S_ddd'+i).attr('ddd',dddd);
			$('#S_ddd'+i).html($('#S_ddd'+i).attr('ddd'));
		}
	});
	
	
   	function Check1(title,imgStr,mmid){
		alert(mmid)
		//alert(num);
		$img = "<img src='../resources/movimg/"+imgStr+"'/>";
		
/* 		$('#S_movieimg').html($img);
		$('#S_movie').html(title);
 */
		$('#S_movieimg').attr('img',$img);
		$('#S_movie').attr('title',title);
		
		$('#S_movieimg').html($('#S_movieimg').attr('img'));
		$('#S_movie').html($('#S_movie').attr('title'));
		
		document.getElementById("mid").value= mmid;
		
/* 	
         var size = document.getElementsByName("movie").length;

        alert(size);

        var movv = "";
        
        for(var i = 0; i < size; i++) {
             if(document.getElementsByName("movie")[i].checked) {
            	 	 
            	 alert(document.getElementsByName("movie")[i].value);
            	 
            	//return document.getElementByName("movie")[i].value;
                break;
             }
        }
        
        movv = $('input:radio[name="movie"]:checked').val(); 
        
 */
	}
	
   	
   	var ttset = '';
   	
	function Check2(no, datedata){
		//document.write(datedata);
		var myData= new Date();
		
		var myDate = new Date(myData.getYear(),myData.getMonth(),myData.getDate()+no-1);
		
		var res = (myDate.getYear()+3800)+"-"+(myDate.getMonth()+1)+"-"+myDate.getDate();
		
		$('#S_date').attr('dd',res);
		$('#S_date').html($('#S_date').attr('dd'));

		//var ttset = '';
		ttset = '';
		
		for (var i = 0; i < dateStr.length; i++) {
			
			var ss = dateStr[i].trim();
			
			var dateset = ss.split(' ')[0];
			var timeset = ss.split(' ')[1];
			
			if(res == dateset){
			//	alert(dateset+","+timeset)
				ttset += timeset+",";
			}
		}
		
//		for (var i = 1; i < ttset.split(',').length; i++) {
		for (var i = 1; i < ttset.split(',').length; i++) {
			//var ttt = "#S_ttt"+i;
	
			alert(ttset.split(',')[i-1])
			
			//$sett = "<c:set var='ss' value="+ttset+" />"
			
			//$("#S_ttt"+i).attr('tt',ttset.split(',')[i-1]);
			$("#S_ttt"+i).attr('tt',ttset.split(',')[i-1]);
			$("#S_ttt"+i).html($("#S_ttt"+i).attr('tt'));
		}
		//$('#S_cnt').html(ttset.split(','));
		alert(ttset);
	
		/* var input = true;
		
		$('#S_input').html(input); */
	}

	function Check3(ssid){
		alert(ssid)
		//var ree = $('#S_ttt'+no).html();
		
		//$('#S_time').attr('mmm',ree);
		//$('#S_time').html($('#S_time').attr('mmm'));
		
		document.getElementById("sid").value= ssid;
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
				<%-- <input type="radio" name="movie" value="${mm.mID }"
					onclick="Check1('${mm.title }', '${mm.image }')"> --%>
			</div>
		</c:forEach>

	</div>

	<div class="S_choice" style="overflow: auto;">
		<div id="S_da">날짜</div>

		<hr>

		<div id="S_da">
			<!--날짜 -->

			<c:forEach begin="1" end="14" var="no">
				<div id="S_ddd${no }" style="float: left"></div>일
 			<input type="radio" name="ddate" value="${no }" id="S_ddd${no }"
					onclick="Check2(${no}, '${datedata }')">
				<div style="clear: both;"></div>
			</c:forEach>

		</div>

		<div id="S_da"></div>
	</div>
	<div class="S_choice" style="overflow: auto;">
		<div id="S_tim">시간</div>

		<hr>

			<c:forEach items="${datedata}" var="dd" varStatus="no">
				<div id="time_${no.index }" onclick="Check3(${dd.sId})">
					<fmt:formatDate value="${dd.mstart }" pattern="HH:mm" /><br>
				</div>
			</c:forEach>

		<c:forEach begin="1" end="10" var="no">
			<%-- <div id="S_ttt${no}" onclick="Check3(${no})"></div> --%>

			<%-- <input type="radio" name="ttime" value="${no }" id="S_ttt${no }" onclick="Check3(${no})"> --%>
		</c:forEach>


		<%-- 		<c:forEach items="${asd}" var="qwe" varStatus="no">
		${qwe }
			<input type="radio" name="ttime"  value="" onclick="Check3()">
		</c:forEach>
 --%>
		<%-- <c:forEach begin="1" end="${asd.length }" var="no">
			<div id="S_ttt${no }"> </div>
			
			<input type='radio' name='ttime'  onclick='Check3()'>
			
		</c:forEach> --%>

		<%-- 		
		<c:forEach items="${timelist }" var="tt">
			<div id="S_tim" >${tt }시 </div>
		</c:forEach>
 --%>
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
	<input type="text" name="sid" id="sid" value="">
	
	<div class="S_choice">
		<input type="submit" value="확인" />
	</div>
	<div style="clear: both"></div>
</form>