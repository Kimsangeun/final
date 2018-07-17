<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
</style>
<script>

</script>


<body>
	<div id="myCarousel" class="carousel slide" data-ride="carousel" style="margin-top :50px">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<c:forEach items="${mainpagemov}" var="mm" varStatus="no">
			<li data-target="#myCarousel" data-slide-to="${no.index }" class="${no.index eq 0 ? 'active' : 'a' }"></li>
			</c:forEach>
			<!-- <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li> -->
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
	</div>
	
	<!-- Marketing messaging and featurettes
    ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->
    
 	<!-- <div class="container-fluid"> -->
    <div class="container marketing">

      <!-- Three columns of text below the carousel -->
      <div class="row">

        	<c:forEach begin="1" end="8" items="${mainpagemov}" var="mm" varStatus="no">
        		<div align="center" class="col-lg-3 col-xs-6 col-sm-4 col-md-4">
        		<img class="img-responsive" src="${pageContext.request.contextPath}\resources\movposter/${mm.poster}" alt="Generic placeholder image" >
        		<p>${mm.title}</p>
        		<c:choose>
        			<c:when test="">
        			
        			</c:when>
        			<c:otherwise>
        			
        			</c:otherwise>
        		</c:choose>
        		<p>${mm.rating}</p>
        		<p><a class="btn btn-default" href="/proj/movie/detailMovie?mid=${mm.mid }" role="button">상세정보 &raquo;</a>
        		<a class="btn btn-default" href="#" role="button">예매하기 &raquo;</a></p>
        		
        		</div>
        	</c:forEach>
   
      </div><!-- /.row -->


      <!-- START THE FEATURETTES -->

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7">
          <h2 class="featurette-heading">First featurette heading. <span class="text-muted">It'll blow your mind.</span></h2>
          <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>
        </div>
        <div class="col-md-5">
          <img class="featurette-image img-responsive center-block" data-src="holder.js/500x500/auto" alt="Generic placeholder image">
        </div>
      </div>

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7 col-md-push-5">
          <h2 class="featurette-heading">Oh yeah, it's that good. <span class="text-muted">See for yourself.</span></h2>
          <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>
        </div>
        <div class="col-md-5 col-md-pull-7">
          <img class="featurette-image img-responsive center-block" data-src="holder.js/500x500/auto" alt="Generic placeholder image">
        </div>
      </div>

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7">
          <h2 class="featurette-heading">And lastly, this one. <span class="text-muted">Checkmate.</span></h2>
          <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>
        </div>
        <div class="col-md-5">
          <img class="featurette-image img-responsive center-block" data-src="holder.js/500x500/auto" alt="Generic placeholder image">
        </div>
      </div>

      <hr class="featurette-divider">

      <!-- /END THE FEATURETTES -->


      <!-- FOOTER -->
      <footer>
        <p class="pull-right"><a href="#">Back to top</a></p>
        <p>&copy; 2014 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
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
</body>
</html>