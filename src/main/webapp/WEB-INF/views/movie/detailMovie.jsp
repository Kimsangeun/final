<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
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
<script src="../resources/star.js"></script>
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

	<div class="row" style="padding-top:100px">
		<div class="col-md-4 col-xs-12" >
			<img src="${pageContext.request.contextPath}\resources\movposter/${moviedata['movie'].poster}" />
		</div>
		<div class="col-md-8  col-xs-12">
			<div style="padding-bottom:25px;border-bottom:1px solid gray;">
			<p class="h1">
			<img alt="fu"
			src="${pageContext.request.contextPath}\resources\imgs/movie_icon_${moviedata['movie'].grade}.gif" />
			${moviedata['movie'].title }
			</p>
			</div>
			<div style="padding-top:25px;  border-bottom:   1px solid gray;">
			<div class="row" style="padding-right:20px">
			<p class="h3 col-md-10 col-sm-8 col-xs-8">${moviedata['movie'].rating }</p>
			<button class="btn btn-danger col-md-2 col-sm-4 col-xs-4">예매하기</button>
			</div>
			<dl class="dl-horizontal text-left">
				  <dt><p class="text-left">개봉일 :</p></dt>
				  <dd> <fmt:formatDate pattern="YYYY-MM-dd" value="${moviedata['movie'].release }"/></dd>
				  <dt><p class="text-left">감독:</p></dt>
				  <dd>${moviedata['movie'].director }</dd>
				  <dt><p class="text-left">출연진:</p></dt>
				  <dd>${moviedata['movie'].actor }</dd>
				  <dt><p class="text-left">장르:</p></dt>
				  <dd>${moviedata['movie'].genre } / ${moviedata['movie'].runtime } 분</dd>
				</dl>
			</div>
		</div>
	</div>
	<div style="padding-top:25px; padding-bottom:50px;border-bottom:   1px solid gray" >
	<p class="h2">줄거리</p>
	<p>${moviedata['movie'].plot}</p>
	</div>
	<c:if test="${moviedata['movie'].steelcut != null and moviedata['movie'].steelcut != '' }">
	<div class="steelcut">
	<p class="h2">스틸컷</p>
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<c:set var="cut_count" value="0"/>
			<c:forTokens var="mm" items="${moviedata['movie'].steelcut }" delims="|" varStatus="no" >
			
			<li data-target="#myCarousel" data-slide-to="${no.index }" class="${no.index eq 0 ? 'active' : 'a' }"></li>
			<c:set var="cut_count" value="${cut_count+1 }"/>
			</c:forTokens>
			
		</ol>
		
		<div class="carousel-inner" role="listbox">
			
			<c:forTokens var="mm" items="${moviedata['movie'].steelcut }" delims="|" varStatus="no" >
			     <div class="${no.index eq 0 ? 'item active' : 'item' }">
					<img class="first-slide" 
						src="${pageContext.request.contextPath}\resources\movcut/${mm}"
						alt="slide">
						<div class="container">
						<div class="carousel-caption">
							<p>
								${no.index+1 } / ${cut_count}
							</p>
						</div>
					</div>
				</div>
		
			</c:forTokens>
			
		</div>
		
		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
	</div>
	</c:if>
	
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
<!-- 
<div id="myCarousel" class="carousel slide" data-ride="carousel">
		Indicators
		<ol class="carousel-indicators">
			<c:forEach items="${mainpagemov}" var="mm" varStatus="no">
			<li data-target="#myCarousel" data-slide-to="${no.index }" class="${no.index eq 0 ? 'active' : 'a' }"></li>
			</c:forEach>
			<!-- <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner" role="listbox">
			<c:forEach items="${mainpagemov}" var="mm" varStatus="no">
				<div class="${no.index eq 0 ? 'item active' : 'item' }">
					<img class="first-slide"
						src="${pageContext.request.contextPath}\resources\movposter/${mm.poster}"
						alt="slide">
					<div class="container">
						<div class="carousel-caption">
							<h1>${mm.title}</h1>
							<p>${mm.title}
							</p>
							<p>
								<a class="btn btn-lg btn-primary" href="#" role="button">예매하러
									가기</a>
							</p>
						</div>
					</div>

					<%-- <div>${mm.title}</div> --%>
				</div>
			</c:forEach>
		</div>
		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div> -->
<!-- </body>
</html> -->