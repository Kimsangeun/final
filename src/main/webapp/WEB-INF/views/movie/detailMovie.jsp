<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<style>
.star-input>.input,
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{display: inline-block;vertical-align:middle;background:url('${pageContext.request.contextPath}/resources/imgs/grade_img.png')no-repeat;}
.star-input{display:inline-block; white-space:nowrap;width:225px;height:40px;padding:25px;line-height:30px;}
.star-input>.input{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
.star-input>.input>input{position:absolute;width:1px;height:1px;opacity:0;}
star-input>.input.focus{outline:1px dotted #ddd;}
.star-input>.input>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{background-size: 150px;background-position: 0 bottom;}
.star-input>.input>label:hover~label{background-image: none;}
.star-input>.input>label[for="p1"]{width:30px;z-index:5;}
.star-input>.input>label[for="p2"]{width:60px;z-index:4;}
.star-input>.input>label[for="p3"]{width:90px;z-index:3;}
.star-input>.input>label[for="p4"]{width:120px;z-index:2;}
.star-input>.input>label[for="p5"]{width:150px;z-index:1;}
.star-input>output{display:inline-block;width:60px; font-size:18px;text-align:right; vertical-align:middle;}
</style>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../resources/jquery-3.3.1.min.js"></script>
<script src="../resources/star.js"></script>
</head>
<script type="text/javascript">
$(function() {
    $('#review').keydown(function (e){
        var content = $(this).val();
        $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
        $('#counter').html(content.length + '/200');
    });
    $('#review').keyup(function (e){
        var content = $(this).val();
        if(content.length>200){
        	alert('200자 이하라구?');
        	$(this).val($(this).val().substr(0, 200));
        }
    });
});
</script>
<body>

	<table border="" >
		<tr>
			<td>타이틀</td>
			<td>${moviedata['movie'].title }</td>
		</tr>
		<tr>
			<td>국가</td>
			<td>${moviedata['movie'].nation }</td>
		</tr>
		<tr>
			<td>장르</td>
			<td>${moviedata['movie'].genre }</td>
		</tr>
		<tr>
			<td>런타임</td>
			<td>${moviedata['movie'].runtime }분</td>
		</tr>
		<tr>
			<c:set var="grade" value="${moviedata['movie'].grade }세 관람가"/>
			<td>상영등급</td>
			<td>${moviedata['movie'].grade eq 0 ? '전체 관람가': 
			(moviedata['movie'].grade eq 19?'청소년 관람불가': grade )}</td>
		</tr>
		<tr>
			<td>감독</td>
			<td>${moviedata['movie'].director }</td>
		</tr>
		<tr>
			<td>배우</td>
			<td>${moviedata['movie'].actor }</td>
		</tr>
		<tr>
			<td>개봉일</td>
			<td>${moviedata['movie'].release }</td>
		</tr>
		
		<tr>
			<td>포스터</td>
			<td><img src="${pageContext.request.contextPath}\resources\movposter/${moviedata['movie'].poster}" /></td>
		</tr>

		<c:forEach items="${fn:split(moviedata['movie'].steelcut,'[|]')}" var="ss">
			<tr>
			<td>스틸컷</td>
			<td><img src="${pageContext.request.contextPath}\resources\movcut/${ss}"/></td>
			</tr>
		</c:forEach>
		<tr>
			<td>줄거리</td>
			<td>${moviedata['movie'].plot }</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<a href='#' onclick='history.back(-1); return false;'>뒤로가기</a>
			</td>
		</tr>
	</table>
	<div>
	<form action="" method="POST">
	<div>
		<span class="star-input">
			<span class="input">
		    	<input type="radio" name="star-input" value="1" id="p1">
		    	<label for="p1">1</label>
		    	<input type="radio" name="star-input" value="2" id="p2">
		    	<label for="p2">2</label>
		    	<input type="radio" name="star-input" value="3" id="p3">
		    	<label for="p3">3</label>
		    	<input type="radio" name="star-input" value="4" id="p4">
		    	<label for="p4">4</label>
		    	<input type="radio" name="star-input" value="5" id="p5">
		    	<label for="p5">5</label>
		  	</span>
  		<output for="star-input"><b>0</b>점</output>						
		</span>
        <br>
    <div class="wrap">
    <textarea id="review" rows="5" cols="20" placeholder="스포일러는 삭제될 수 있습니다."  maxlength="200"></textarea>
    <span id="counter">###</span>
	</div>
	<button >작성</button>
	</div>
	<input type="hidden" name="${mem.id }"/>
	</form>
	<br>
	<c:forEach items="${moviedata['review']}" var="rr" varStatus="no">
		<div>${rr.id }
		</div>
		<div>${rr.score }점
		</div>
		<div>${rr.reg_date }
		</div>
		<div>${rr.review }
		</div>
		<br>
	</c:forEach>
	</div>
	
<!-- </form> -->


</body>
</html>