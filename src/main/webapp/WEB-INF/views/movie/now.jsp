<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:forEach items="${moviedata}" var="dd" varStatus="no">
		<img src="${pageContext.request.contextPath}\resources\movposter/${dd.poster}" />
		${dd.title }
</c:forEach> --%>

<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<script type="text/javascript">
/* $(document).ready(function() {
	   var maxHeight = -1;

	   $('.features').each(function() {
	     maxHeight = maxHeight > $(this).height() ? maxHeight : $(this).height();
	   });

	   $('.features').each(function() {
	     $(this).height(maxHeight);
	   });
	 }); */
	 $(document).ready(function(){
		 
		 var aa = 0;
		 console.log('${moviedata[1]}');
		/*  aa.sort(function(a,b){
			 return a.rating - b.rating;
		 });
		 console.log(aa);
		 console.log('zz'); */
		/*   $('.order').click(function(){
		     var fruitName = $('ul').children('li').get(); //리스트의 자식엘리먼트를 가져와 변수에 저장
		     fruitName.sort(function(a,b){ // 배열변수? fruitName에 sort함수를 호출/ a,b에 할당
		          var val1 =$(a).text().toUpperCase(); // 배열의 엘리먼트들을 대문자로 변경
		          var val2 =$(b).text().toUpperCase();
		          return(val1<val2)?-1:(val1>val2)?1:0; //★ 
		       /*
		* 첫번째 값 < 두번째 값 : 0보다 작은 값을 반환 : 두번째 값을 아래로
		* 첫번째 값 = 두번째 값 : 0을 반환 : 정렬순서를 그대로
		* 첫번째 값  > 두번째 값 : 0보다 큰 값을 반환 : 첫번째 값을 아래로
		★ 를 if문으로 풀어보자면 다음과 같다.

		    if (val1 < val2)
		    {
		         valStr = -1;
		    }else
		    {
		          if (val1 > val2)
		          {
		               valStr = 1;
		          }else{
		               valStr = 0;
		          }
		    } 
		    */

		});


$(window).on('load', function () {
	load('#js-load', '4');
	$("#js-btn-wrap .button").on("click", function () {
		load('#js-load', '4', '#js-btn-wrap');
	})
	
});

</script>

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

<div id="js-load" class="container" style="margin-top: 100px">
		<%-- <div class="row">
			<c:forEach items="${moviedata}" var="mm"
				varStatus="no">
				<div align="center" style="border: 1px solid lightgray"
					class="features col-lg-3 col-xs-6 col-sm-4 col-md-4 movietool js-load">
					<a href="/proj/movie/detailMovie?mid=${mm.mid }"> <img
						class="img-responsive"
						src="${pageContext.request.contextPath}\resources\movposter/${mm.poster}"
						alt="Generic placeholder image">
					</a>
					<p>${mm.title}</p>
					<c:choose>
						<c:when test="">

						</c:when>
						<c:otherwise>

						</c:otherwise>
					</c:choose>
					<p>${mm.rating}</p>
					<p>
						<a class="btn btn-default"
							href="/proj/movie/detailMovie?mid=${mm.mid }" role="button">상세정보
							&raquo;</a> <a class="btn btn-default" href="#" role="button">예매하기
							&raquo;</a>
					</p>

				</div>
			</c:forEach>

		</div> --%>
		
		<div class="row" >

        	<c:forEach items="${moviedata}" var="mm" varStatus="no">
        		<div align="center" class="col-lg-3 col-xs-6 col-sm-4 col-md-3 js-load" style="height:500px">
        		<a href="/proj/movie/detailMovie?mid=${mm.mid }">
        		<img class="img-responsive" src="${pageContext.request.contextPath}\resources\movposter/${mm.poster}" alt="Generic placeholder image" >
        		</a>
        		<p class="hidden-xs h3 ellipsis">${mm.title}</p>
				<div class="fixedStar" id="Star_${no.index }"></div>
				<script type="text/javascript">
				$(function() {
				    $('#Star_${no.index }').raty({
				    	size:24,
						half:true,
						path:'/proj/resources/imgs/',
						scoreName:'rating',
						starHalf:'star-half-big.png',
						starOn:'star-on-big.png',
						starOff:'star-off-big.png',
				    	  readOnly:  true,
				    	  start:   ${mm.rating/2}
				    	});
				});
				</script>

        		<p><a class="btn btn-default" href="/proj/movie/detailMovie?mid=${mm.mid }" role="button">상세정보 &raquo;</a>
        		<a class="btn btn-default" href="/proj/reservation/reser" role="button">예매하기 &raquo;</a></p>
        		
        		</div>
        	</c:forEach>
   
      </div>
		<div align="center" id="js-btn-wrap" class="btn-wrap">
		<button id="moreButton" class="button btn btn-default">더보기</button>
		<!-- <a href="javascript:;" class="button">더보기</a> -->
		</div>
	</div>
