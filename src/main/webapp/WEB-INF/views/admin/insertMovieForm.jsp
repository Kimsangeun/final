<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!-- (Optional) Latest compiled and minified JavaScript translation files -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/i18n/defaults-*.min.js"></script> -->

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/css/jasny-bootstrap.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="//cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/js/jasny-bootstrap.min.js"></script>

<!-- <script type="text/javascript" src="/proj/resources/js/pekeUpload.js"></script> -->
<script>

$(document).ready(function() {
	$('#movieSelect').change(function(){
		str ='';
		$("#movieSelect option:selected").each(function () {
			str += $(this).text() + " ";
			});
		document.movie.genre.value = str;
	});

	 });

function getMultipleSelectedValue()
{
  var x = document.getElementById("movieSelect");
  var gen='';
  for (var i = 0; i < x.options.length; i++) {
     if(x.options[i].selected ==true){
    	 gen += x.options[i].value+',';  
      }
  }
  alert(gen);
}

function chk_file_type(obj) {
	 var file_kind = obj.value.lastIndexOf('.');
	 var file_name = obj.value.substring(file_kind+1,obj.length);
	 var file_type = file_name.toLowerCase();



	// var check_file_type=new Array();​

	 var check_file_type=['jpg','gif','png','jpeg','bmp'];



	 if(check_file_type.indexOf(file_type)==-1){
		 $('#oLoginModal').modal();
	  obj.outerHTML = obj.outerHTML;
	  /* var parent_Obj=obj.parentNode
	  var node=parent_Obj.replaceChild(obj.cloneNode(true),obj); */
	  return false;
	 }
	}

function preview_images() 
{

 var total_file=document.getElementById("images").files.length;
 for(var i=0;i<total_file;i++)
 {
  $('#image_preview').append("<div class='thumbnail col-lg-3 col-md-4 col-xs-6' style='max-width: 200px; max-height: 150px;'>"+
		  "<img class='' style=' max-height:130px; max-width:100%' src='"+URL.createObjectURL(event.target.files[i])+"'></div>");
 }
}
</script>
<div class="modal fade" id="oLoginModal" tabindex="-1" role="dialog"
		aria-labelledby="oLoginModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				
				<div class="modal-body">이미지 파일만 올려주세요.</div>
				<div class="modal-footer">
					<button id="noLoginModalOk" type="button" data-dismiss="modal" class="btn btn-primary">확인</button>
				</div>
			</div>
		</div>
	</div>
<div class="container" style="padding-top: 50px">

	<form name="movie" action="insertMovie" method="post" enctype="multipart/form-data"
		accept-charset="UTF-8">
		<div class="form-group">
			<label for="title">영화명</label> <input type="text" required="required" maxlength="50"
				class="form-control" id="title" name= "title" placeholder="영화명을 입력하세요">
		</div>
		<div class="form-group">
			<label for="nation">국가</label> <input type="text" required="required" maxlength="30"
				class="form-control" id="nation" name="nation" placeholder="국가를 입력하세요">
		</div>
		<div class="form-group">
			<label for="movieSelect">장르</label> 
			<select name="movie" multiple title="장르를 선택해 주세요" data-actions-box="true" required="required"
				id="movieSelect" class="form-control selectpicker" multiple="multiple" >
				<option value="가족">가족</option>				<option value="공포/호러">공포/호러</option>
				<option value="드라마">드라마</option>				<option value="SF">SF</option>
				<option value="멜로/로맨스">멜로/로맨스</option>				<option value="코미디">코미디</option>
				<option value="애니메이션">애니메이션</option>				<option value="느와르">느와르</option>
				<option value="단편">단편</option>				<option value="다큐멘터리">다큐멘터리</option>
				<option value="로드무비">로드무비</option>				<option value="무협">무협</option>
				<option value="뮤지컬">뮤지컬</option>				<option value="뮤직">뮤직</option>
				<option value="미스터리">미스터리</option>				<option value="범죄">범죄</option>
				<option value="옴니버스">옴니버스</option>				<option value="서부">서부</option>
				<option value="스릴러">스릴러</option>				<option value="스포츠">스포츠</option>
				<option value="시대극/사극">시대극/사극</option>				<option value="아동">아동</option>
				<option value="액션">액션</option>				<option value="어드벤처">어드벤처</option>	
				<option value="역사">역사</option>				<option value="전기">전기</option>				
				<option value="전쟁">전쟁</option>				<option value="종교">종교</option>				<option value="재난">재난</option>
				<option value="청춘영화">청춘영화</option>				<option value="퀴어">퀴어</option>
				<option value="판타지">판타지</option>				<option value="학원물">학원물</option>
				<option value="에로">에로</option>				
			</select>
		</div>
		<input type="hidden" value="" name="genre"/>
		<div class="form-group">
			<label for="runtime">런타임</label> 
			<input id="runtime" required="required" name="runtime" type="number" min="1" max="999"
			class="form-control" name="runtime" placeholder="런타임을 입력해주세요">
		</div>
		<div class="form-group">
			<label for="ratingSelect">상영등급</label>
			<select name="grade" title="상영등급을 선택해 주세요" id="ratingSelect" 
			required="required" class="form-control selectpicker">
			<option value="0">전체이용가</option>
			<option value="12">12세 이상 관람가</option>
			<option value="15">15세 이상 관람가</option>
			<option value="18">청소년 관람불가</option>
			</select>
		</div>
		<div class="form-group"> 
			<label for="director">감독</label> <input type="text" required 
				class="form-control" id="director" name="director" placeholder="감독">
		</div>
		<div class="form-group">
			<label for="actor">배우</label> <input type="text" required 
				class="form-control" id="actor" name="actor"  placeholder="암호">
		</div>
		<div class="form-group">
			<label for="release">개봉일</label> <input type="date" required min="sysdate"
				class="form-control" id="release" name="release" placeholder="암호">
		</div>
		<div class="form-group">
			<label for="poster">포스터</label> 
			<input accept="image/*" onchange='chk_file_type(this)' required="required" type="file" id="poster" name="poster1" class="form-control"/>
		</div>

		<div class="form-group">
			<label for="1">스틸컷</label> 
			<input type="file" accept="image/*" class="form-control" id="images" required="required"
			name="steelcuts" onchange="preview_images();" multiple/>
			 <div class="row" id="image_preview"></div>
		</div>
		
		<div class="form-group">
			<label for="plot">줄거리</label><!--  <input type="text"
				class="form-control" id="plot" name="plot" placeholder="암호"> -->
				<textarea style="resize: vertical;" class="form-control" id="plot" maxlength="800"
				placeholder="줄거리를 입력해 주세요" rows="5" name="plot" cols="20"></textarea>
		</div>
		
		<button type="submit" class="btn btn-default pull-right">제출</button>
	</form>

</div>
