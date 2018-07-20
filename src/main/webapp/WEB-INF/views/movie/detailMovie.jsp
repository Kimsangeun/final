<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
  
<script type="text/javascript">
$(function() {
	
	$('.slider').bxSlider({

		 adaptiveHeight: true
/* 		  mode: 'fade' */

		});
	

    $('#review').keydown(function (e){
        var content = $(this).val();
        $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
        $('#counter').html('<small>'+content.length + '/200</small>');
    });
    $('#review').keyup(function (e){
        var content = $(this).val();
        if(content.length>200){
        	$(this).val($(this).val().substr(0, 200));
        }
    });
    
    $('#dddd').raty({
		size:24,
		half:true,
		path:'/proj/resources/imgs/',
		scoreName:'score',
		starHalf:'star-half-big.png',
		starOn:'star-on-big.png',
		starOff:'star-off-big.png',
		target:     '#hint2',
		targetKeep:true,
		start:1
	});
    
    $('#ddddd').raty({
		size:24,
		half:true,
		path:'/proj/resources/imgs/',
		scoreName:'score',
		starHalf:'star-half-big.png',
		starOn:'star-on-big.png',
		starOff:'star-off-big.png',
		target:     '#hint2',
		targetKeep:true,
		start:1
	});
    
    var ss = ${moviedata['movie'].rating/2};
    
    $('#fixedStar').raty({
    	size:24,
		half:true,
		path:'/proj/resources/imgs/',
		scoreName:'rating',
		starHalf:'star-half-big.png',
		starOn:'star-on-big.png',
		starOff:'star-off-big.png',
    	  readOnly:  true,
    	  target:     '#hint1',
    	  targetKeep:true,
    	  start:     ss
    	});
    
  
    
});
</script>
<style>

/* .bx-wrapper, .bx-viewport, .bx-wrapper img {height: 500px !important;} 
슬라이더에 고정값 줄거면 쓰자.
*/
.vertical-align {
    display: flex;
    align-items: center;
}
.qq{
  display: flex; /* equal height of the children */
}

.q {

/*   padding: 1em; */
  border: 1px solid lightgray;
}

</style>

<div class="row" style="padding-top: 100px">
	<div class="col-md-4 col-xs-12">
		<img class="img-responsive"
			src="${pageContext.request.contextPath}\resources\movposter/${moviedata['movie'].poster}" />
	</div>
	<div class="col-md-8  col-xs-12">
		<div style="padding-bottom: 25px; border-bottom: 1px solid lightgray;">
			<p class="h1">
				<img alt="fu"
					src="${pageContext.request.contextPath}\resources\imgs/movie_icon_${moviedata['movie'].grade}.gif" />
				${moviedata['movie'].title }
			</p>
		</div>
		<div style="padding-top: 25px; border-bottom: 1px solid lightgray;">
			<div class="row" style="padding-right: 20px">

				<div class="col-md-3 col-sm-4 col-xs-4" id="fixedStar"></div>
				<div class="h3 col-md-7 col-sm-4 col-xs-4" id="hint1"></div>
				<button class="btn btn-danger col-md-2 col-sm-4 col-xs-4">예매하기</button>
			</div>
			<dl class="dl-horizontal text-left">
				<dt>
					<p class="text-left">개봉일 :</p>
				</dt>
				<dd>
					<fmt:formatDate pattern="YYYY-MM-dd"
						value="${moviedata['movie'].release }" />
				</dd>
				<dt>
					<p class="text-left">감독:</p>
				</dt>
				<dd>${moviedata['movie'].director }</dd>
				<dt>
					<p class="text-left">출연진:</p>
				</dt>
				<dd>${moviedata['movie'].actor }</dd>
				<dt>
					<p class="text-left">장르:</p>
				</dt>
				<dd>${moviedata['movie'].genre }/ ${moviedata['movie'].runtime }
					분</dd>
			</dl>
		</div>
	</div>
</div>
<div
	style="padding-top: 25px; padding-bottom: 50px; border-bottom: 1px solid lightgray">
	<p class="h2">줄거리</p>
	<p>${moviedata['movie'].plot}</p>
</div>
<c:if
	test="${moviedata['movie'].steelcut != null and moviedata['movie'].steelcut != '' }">
	
	<p class="h2">스틸컷</p>
	
	<div class="slider">
		<c:forTokens var="mm" items="${moviedata['movie'].steelcut }"
			delims="|" varStatus="no">
			<div class="center-block" style="padding : 0 0 0 0;left:0px;margin:0 0 0 0;">
				<img class="img-responsive center-block"
					src="${pageContext.request.contextPath}\resources\movcut/${mm}"
					alt="slide">
			</div>
			<%-- <img class="img-resposive"
					src="${pageContext.request.contextPath}\resources\movcut/${mm}"
					alt="slide"> --%>
		</c:forTokens>
<!-- 		<div>I am a slide.</div>
    <div>I am another slide.</div> -->
	</div>
</c:if>
<%-- <form action="" method="POST">


	<div class="" id="dddd"></div>
	<!-- <p id="hint2">bad</p> -->
	<div class="wrap form-group">
		<span id="counter">0/200</span>
		<textarea style="resize: none;" class="form-control" id="review" rows="5" cols="20"
			placeholder="스포일러는 삭제될 수 있습니다." maxlength="200"></textarea>
	</div>

	<button type="submit" class="btn btn-primary">작성</button>
	<input type="hidden" name="${mem.id }" />
</form>

<form action="" method="POST">

	<div class="row">
	
	
	<div class="col-lg-3" id="ddd"></div>
	<!-- <p id="hint2">bad</p> -->
	<div class="wrap form-group col-xs-12 col-lg-9">
		<span id="counter">0/200</span>
		<textarea style="resize: vertical;" class="form-control" id="review" rows="5" cols="20"
			placeholder="스포일러는 삭제될 수 있습니다." maxlength="200"></textarea>
	</div>
	<button  type="submit" class="btn btn-primary col-lg-1">작성</button>
	</div>
	<input type="hidden" name="${mem.id }" />
</form>
<div> --%>
<span id="counter"><small>0/200</small></span>
<form  action="reviewInsert" method="POST">
<div class="row qq" >
	<div class="q form-group col-lg-2 col-xs-3 vertical-align" >
	<div class=" center-block" id="ddddd"></div>
	</div>
	
	<div class="q wrap form-group col-lg-9 col-xs-8" style="padding:0 0 0 0;">
		<textarea name="review" style="width:100%; resize: none;" class="form-control" id="review" rows="5" cols="20"
			placeholder="스포일러는 삭제될 수 있습니다." maxlength="200"></textarea>
	</div>
	<div  style="padding:0 0 0 0;" class="q form-group col-lg-1 col-xs-1" >
	<button style="width:100%;height:100%" class="btn btn-default"  type="submit" >작성</button>
	</div>
</div>
	<input type="hidden" name="id" value="${mem.id }" />
	<input type="hidden" name="mid" value="${param.mid }" />
</form>

<div id="js-load" class="main border">
<ul class="list list-group row">
	<c:forEach items="${moviedata['review']}" var="rr" varStatus="no">
	<li class="list-group-item lists__item js-load col-lg-6 col-xs-12 ">

		<div>${rr.id }</div>
		<div>${rr.score }점</div>
		<div>${rr.reg_date }</div>
		<div>${rr.review }</div>
		<br>

		</li>
	</c:forEach>
	</ul>
	
	<div id="js-btn-wrap" class="btn-wrap"><button id="moreButton" class="button btn btn-default">더보기</button> <a href="javascript:;" class="button">더보기</a> </div>
</div>

