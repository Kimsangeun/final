<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<script type="text/javascript">

	$(document).ready(function(){
		   var max_h=0;
		   $("#aaa li").each(function(){
		 var h = parseInt($(this).css("height"));
		    if(max_h<h){ max_h = h; }
		   });
		   $("#aaa li").each(function(){
		 $(this).css({height:max_h});
		   });
		  });

	$(function() {

		$('.slider').bxSlider({

			adaptiveHeight : true
		/* 		  mode: 'fade' */

		});

		$('#review').keydown(function(e) {
			var content = $(this).val();
			$(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
			$('#counter').html('<small>' + content.length + '/200</small>');
		});
		$('#review').keyup(function(e) {
			var content = $(this).val();
			if (content.length > 200) {
				$(this).val($(this).val().substr(0, 200));
			}
		});

		$('#starscore').raty({
			size : 24,
			half : true,
			path : '/proj/resources/imgs/',
			scoreName : 'tmpScore',
			starHalf : 'star-half-big.png',
			starOn : 'star-on-big.png',
			starOff : 'star-off-big.png',
			start : 1,
			click : function(score, evt) {
				/* var score=score*2;
				this.attr('score',score*2);
				console.log('ID: ' + this.attr('id') + '\nscore: ' + score + '\nevent: ' + evt);
				return score; */
				/* 	$('#starscore').raty('setScore', 10); */
			}
		});

		var ss = ${	moviedata['movie'].rating / 2};

		$('#fixedStar').raty({
			size : 24,
			half : true,
			path : '/proj/resources/imgs/',
			scoreName : 'rating',
			starHalf : 'star-half-big.png',
			starOn : 'star-on-big.png',
			starOff : 'star-off-big.png',
			readOnly : true,
			target : '#hint1',
			targetKeep : true,
			start : ss
		});
		

	});
	/* $('#starscore').click({
	 console.log('gg');
	 }); */
</script>
<style>

/* .bx-wrapper, .bx-viewport, .bx-wrapper img {height: 500px !important;} 
슬라이더에 고정값 줄거면 쓰자.
*/
.vertical-align {
	display: flex;
	align-items: center;
}

.qq {
	display: flex; /* equal height of the children */
}

.q {
	/*   padding: 1em; */
	border: 1px solid lightgray;
}
</style>
<style>
.js-load {
	display: none;
}

.js-load.showMore {
	display: block;
}

.is_comp.js-load:after {
	display: none;
}

.btn-wrap, .lists, .main {
	display: block;
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
				<img alt="noImg"
					src="${pageContext.request.contextPath}\resources\imgs/movie_icon_${moviedata['movie'].grade}.gif" />
				${moviedata['movie'].title }
				<c:if test="${mem.id eq 'admin' }">
					<input class="btn btn-danger" type="button" value="삭제"
						onclick="location.href='/proj/admin/deleteMovie?mid=${param.mid}'">
					<input class="btn btn-warning" type="button" value="수정"
						onclick="location.href='/proj/admin/modifyForm?mid=${param.mid}'">
				</c:if>
			</p>
		</div>
		<div style="padding-top: 25px; border-bottom: 1px solid lightgray;">
			<div class="row" style="padding-right: 20px">

				<div class="col-md-4 col-sm-4 col-xs-4" id="fixedStar"></div>
				<div class="h3 col-md-6 col-sm-4 col-xs-4" id="hint1"></div>
				<a class="btn btn-danger col-md-2 col-sm-4 col-xs-4"
					href="/proj/reservation/reser" role="button">예매하기 &raquo;</a>
				<!-- <button onclick="location.href('proj/reservation/reser')"
				class="btn btn-danger col-md-2 col-sm-4 col-xs-4">예매하기</button> -->
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
				<dd>${moviedata['movie'].genre }/${moviedata['movie'].runtime }
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
			<div class="center-block"
				style="padding: 0 0 0 0; left: 0px; margin: 0 0 0 0;">
				<img class="img-responsive center-block"
					src="${pageContext.request.contextPath}\resources\movcut/${mm}"
					alt="slide">
			</div>

		</c:forTokens>

	</div>
</c:if>


<span id="counter"><small>0/200</small></span>
<form action="reviewInsert" method="POST">
	<div class="row qq">
		<div class="q form-group col-lg-2 col-xs-3 vertical-align">
			<div class=" center-block" id="starscore"></div>
		</div>

		<div class="q wrap form-group col-lg-9 col-xs-8"
			style="padding: 0 0 0 0;">
			<textarea name="review" style="width: 100%; resize: none;"
				class="form-control" id="review" rows="5" cols="20"
				placeholder="스포일러는 삭제될 수 있습니다." maxlength="200"></textarea>
		</div>
		<div style="padding: 0 0 0 0;" class="q form-group col-lg-1 col-xs-1">
			<button style="width: 100%; height: 100%" class="btn btn-default"
				type="submit">작성</button>
		</div>
	</div>
	<fmt:formatNumber var="ss" value="${scor}" pattern="#.#" />

	<c:out value="${ss }"></c:out>
	<input type="hidden" name="id" value="${mem.id }" /> <input
		type="hidden" name="mid" value="${param.mid }" />
	<!-- <input type="hidden" name="score"/> -->
</form>


<div id="js-load" class="main border">
	<ul id="aaa" class="list list-group row rw">
		<c:forEach items="${moviedata['review']}" var="rr" varStatus="no">
			<li class="list-group-item lists__item js-load col-lg-6 col-xs-12 "
				style="height: 150px;">
				<p class="h3">${rr.id }
					<c:if test="${mem.id eq rr.id}">
						<form id="deleteReview" action="deleteReview" method="post">

							<button type="button" class="btn btn-danger btn-xs"
								data-toggle="modal" data-target="#myModal">
								<span class="glyphicon glyphicon-remove"></span>
							</button>

							<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
								aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
											<h4 class="modal-title" id="myModalLabel">삭제</h4>
										</div>
										<div class="modal-body">리뷰를 삭제하시겠습니까?</div>
										<div class="modal-footer">
											<button type="button" onclick="submit()"
												class="btn btn-default" data-dismiss="modal">네</button>
											<button type="button" data-dismiss="modal"
												class="btn btn-primary">아니오</button>
										</div>
									</div>
								</div>
							</div>
							<input type="hidden" value="${param.mid }" name="mid" /> <input
								type="hidden" value="${rr.id }" name="id" />
						</form>
					</c:if>
				</p>


				<div>
					<div style="float: left">
						<fmt:formatDate pattern="yy.MM.dd HH:mm" value="${rr.reg_date }" />
					</div>
					<div style="padding: 0 0 0 0; margin-left: 5px" class="fixedStar"
						id="review_${no.index }"></div>
					<script type="text/javascript">
				$(function() {
				    $('#review_${no.index }').raty({
						half:true,
						path:'/proj/resources/imgs/',
						scoreName:'rating',
				    	  readOnly:  true,
				    	  start: ${rr.score/2},
				    });
				});
				</script>
				</div>
				<div>${rr.review }</div>

			</li>
		</c:forEach>
	</ul>
</div>
<div id="js-btn-wrap" class="btn-wrap">
	<button id="moreButton" class="button btn btn-default">더보기</button>
	<!-- <a href="javascript:;" class="button">더보기</a> -->
</div>


