<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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
        	$(this).val($(this).val().substr(0, 200));
        }
    });
    $('#dddd').raty({
		size:24,
		half:true,
		path:'/proj/resources/imgs/',
		scoreName:'rating',
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
.carousel-inner>.item>img {
	position: absolute;
	min-width: auto !important;
	height: 100% !important;
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
	<div class="steelcut">
		<p class="h2">스틸컷</p>
		<div id="myCarousel" class="carousel slide" data-ride="carousel">

			<!-- Indicators -->
			<ol class="carousel-indicators">
				<c:set var="cut_count" value="0" />
				<c:forTokens var="mm" items="${moviedata['movie'].steelcut }"
					delims="|" varStatus="no">

					<li data-target="#myCarousel" data-slide-to="${no.index }"
						class="${no.index eq 0 ? 'active' : 'a' }"></li>
					<c:set var="cut_count" value="${cut_count+1 }" />
				</c:forTokens>

			</ol>

			<div class="carousel-inner" role="listbox">

				<c:forTokens var="mm" items="${moviedata['movie'].steelcut }"
					delims="|" varStatus="no">
					<div class="${no.index eq 0 ? 'item active' : 'item' }">
						<img class="first-slide"
							src="${pageContext.request.contextPath}\resources\movcut/${mm}"
							alt="slide">
						<div class="container">
							<div class="carousel-caption">
								<p>${no.index+1 } / ${cut_count}</p>
							</div>
						</div>
					</div>

				</c:forTokens>

			</div>

			<a class="left carousel-control" href="#myCarousel" role="button"
				data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel" role="button"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
	</div>
</c:if>
<form action="" method="POST">


	<div class="" id="dddd"></div>
	<p id="hint2">bad</p>
	<div class="wrap form-group">
		<span id="counter">0/200</span>
		<textarea class="form-control" id="review" rows="5" cols="20"
			placeholder="스포일러는 삭제될 수 있습니다." maxlength="200"></textarea>
	</div>

	<button type="submit" class="btn btn-primary">작성</button>
	<input type="hidden" name="${mem.id }" />
</form>

<br>
<div>
	<c:forEach items="${moviedata['review']}" var="rr" varStatus="no">
		<div>${rr.id }</div>
		<div>${rr.score }점</div>
		<div>${rr.reg_date }</div>
		<div>${rr.review }</div>
		<br>
	</c:forEach>
</div>

