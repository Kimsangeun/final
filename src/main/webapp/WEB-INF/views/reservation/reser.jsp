<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<!DOCTYPE html>
<style>
.S_choice{
	float: left;
	margin-left: 20px;
}
</style>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>

<script type="text/javascript">
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
	
	
   		function Check(title,imgStr){
		
		//alert(num);
		$img = "<img src='../resources/movimg/"+imgStr+"'/>";
		
/* 		$('#S_movieimg').html($img);
		$('#S_movie').html(title);
 */
		$('#S_movieimg').attr('hh',$img);
		$('#S_movie').attr('title',title);
		
		$('#S_movieimg').html($('#S_movieimg').attr('hh'));
		$('#S_movie').html($('#S_movie').attr('title'));
		
	
       /*  var size = document.getElementsByName("movie").length;

        alert(size);

        var movv = "";
        
        for(var i = 0; i < size; i++) {
             if(document.getElementsByName("movie")[i].checked) {
            	 	 
            	 alert(document.getElementsByName("movie")[i].value);
            	 
            	//return document.getElementByName("movie")[i].value;
                break;
             }
        }
        
        movv = $('input:radio[name="movie"]:checked').val(); */

   }
	

</script>
<form action="">
	<div class="S_choice">
		<div id="S_mov">영화선택</div>
		<%-- 	
	<c:forEach items="${moviedata}" var="dd" varStatus="no">
		<div id="S_mov" >
		<button id="bb${no.index }" class="btn" data-toggle="button" aria-pressed="false" autocomplete="off"> ${dd.title }</button> 
		</div>
	</c:forEach> 
--%>

		<c:forEach items="${moviedata }" var="dd" varStatus="no">
			<div id="S_mov">
				${dd.title }<input type="radio" name="movie" value="${dd.mID }" onclick="Check('${dd.title }', '${dd.image }')">
			</div>
		</c:forEach>

	</div>
	
	<div class="S_choice">
		<div id="S_da">날짜선택</div>
		<div id="S_da">
			<!--날짜 -->

			<input type="date" id="date" />

		</div>
		
		<script>
			$('#date').change(function(){
				var date = $('#date').val();
				alert(date);
				
				$('#S_date').attr('dd',date);
				$('#S_date').html($('#S_date').attr('dd'));
			});
		</script>
		
		
		<div id="S_da"></div>	
	</div>
	<div class="S_choice">
		<div id="S_tim">시간선택</div>
	
<%-- 		
		<c:forEach items="${timelist }" var="tt">
			<div id="S_tim" >${tt }시 </div>
		</c:forEach>
 --%>
 	</div>
	<div style="clear: both"></div>
	
	<hr>
	
	<div id="S_movieimg" class="S_choice"> </div>
	<div id="S_movie" class="S_choice"> </div>
	<div id="S_date" class="S_choice"> </div>
	<div id="S_time" class="S_choice"> </div>
	<div class="S_choice">
		<input type="button" value="확인" onclick=""/>
	</div>
	<div style="clear: both"></div>
</form>