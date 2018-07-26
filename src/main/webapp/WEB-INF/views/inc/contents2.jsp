<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script type="text/javascript">
$(function() {
$('.slider').bxSlider({
	mode: 'fade',
	 auto: true,        // 자동 실행 여부
     autoHover: true,   // 마우스 호버시 정지 여부
     /* captions: true,	// 밑에캡션 */
});
});
</script>
<style>

.ellipsis{

 overflow: hidden;

 text-overflow: ellipsis;

 display: -webkit-box;

 -webkit-line-clamp: 1; /* 라인수 */

 -webkit-box-orient: vertical;

 word-wrap:break-word; 

} 

@media screen and (max-width : 500px){
.col-xs-4{
	width:220px;
	}
}

@media screen and (max-width : 992px){
.rank{
	left:10px;
	}
}

@media screen and (max-width : 1200px){
.rank{
	left:20px;
	}
}

@media screen and (min-width : 1200px){
.rank{
	left:33px;
	}
}
</style>



<div class="slider">
<c:forEach items="${promo}" var="mm" varStatus="no">

<a href="/proj/movie/detailMovie?mid=${mm.cnt }">
<img class="img-responsive" title="${mm.title }"
src="${pageContext.request.contextPath}\resources\board/${mm.upfile}" alt="slide">
</a>
</c:forEach>
						
</div>

 	
		
    <div class="container marketing" style="margin-top :50px">
		<div align="right" >
		<p><a class="btn btn-default" href="/proj/movie/boxoffice" role="button">
		<span class="glyphicon glyphicon-plus"> 전체보기</span>
		</a>
        	</p>
		</div>
     <%--  <div align="center" class="hidden-lg" >
      	<img class="img-responsive" alt="" src="${pageContext.request.contextPath}\resources\imgs/ticket.png"/>
      	
      </div> --%>
      <div class="row" >

        	<c:forEach begin="0" end="7" items="${mainpagemov}" var="mm" varStatus="no">
        		<div align="center" class="col-lg-3 col-xs-4 col-sm-4 col-md-3" style="height:500px">
        		
        		<a href="/proj/movie/detailMovie?mid=${mm.mid }">
        		<img class="rank"  style="position: absolute;width:40px;top:3px;"
        		src="${pageContext.request.contextPath}\resources\imgs/${no.index+1}.png" alt="Generic placeholder image" >
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
   
      </div><!-- /.row -->


      <!-- START THE FEATURETTES -->

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7">
          <h2 class="featurette-heading">영화, 그 이상의 감동<span class="text-muted"><br></span></h2>
          <p class="lead"><br>중앙시네마는 선진화된 관람문화와 최고의 서비스로<br>고객에게 잊을 수 없는 감동을 선사합니다
          </p>
        </div>
        <div class="col-md-5">
          <img style="padding-top:100px" class="featurette-image img-responsive center-block" 
          src="${pageContext.request.contextPath}\resources\imgs/cgv.jpg"
          alt="Generic placeholder image">
        </div>
      </div>

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7 col-md-push-5">
          <h2 class="featurette-heading">LIFE THEATER <span class="text-muted"></span></h2>
          <p class="lead">영화보다 멋진 당신의 일상을 위하여<br>안목있는 콘텐츠와 라이프스타일을 제안합니다</p>
        </div>
        <div class="col-md-5 col-md-pull-7">
          <img style="padding-top:100px" class="featurette-image img-responsive center-block" 
          src="${pageContext.request.contextPath}\resources\imgs/screen.jpg"
          alt="Generic placeholder image">
        </div>
      </div>

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7">
          <h2 class="featurette-heading">SNACK BAR<span class="text-muted"></span></h2>
          <p class="lead">오직 중앙시네마에서만 만날 수 있는 최고의 팝콘을 즐겨보세요</p>
        </div>
        <div class="col-md-5">
          <img style="padding-top:100px" class="featurette-image img-responsive center-block" 
         src="${pageContext.request.contextPath}\resources\imgs/snack.jpg" 
         alt="Generic placeholder image">
        </div>
      </div>

      <hr class="featurette-divider">

      <!-- /END THE FEATURETTES -->


      <!-- FOOTER -->
      <footer>
        <p class="pull-right"><a href="#">Back to top</a></p>
        <p>&copy; 2018 JHTA Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
      </footer>

    </div><!-- /.container -->
	<!-- /.carousel -->

	<%-- 
	<div class="mainPage" >

<c:forEach items="${mainpagemov}" var="mm" varStatus="no">
	<div class="mainMovie">
		<div><img class="mainImg" src="${pageContext.request.contextPath}\resources\movposter/${mm.poster}" /></div>
		<div>${mm.title}</div>
	</div>
</c:forEach>
	
</div> --%>
