<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<style>
</style>

<script>

</script>


<div class="page-header">
	<h1>
		신작 홍보 <small></small>
	</h1>
</div>
<div class="">

	<c:forEach items="${data['promo'] }" var="mm" varStatus="no">
	<form style="margin-bottom:60px" class="form-inline" action="promoReg" method="POST" enctype="multipart/form-data"
		accept-charset="UTF-8">
	  <div class="form-group">
		<label for="movieSelect">슬롯${no.index+1 }</label>
		 <select required="required" name="cnt" id="movieSelect" class="selectpicker" data-live-search="true"> 
		 <c:forEach items="${data['movie'] }" var="nn">
		 	<c:choose>
		 		<c:when test="${mm.cnt eq nn.mid }">
		 			<option selected="selected" value="${nn.mid }">${ nn.title}</option> 
		 		</c:when>
		 		<c:otherwise>
		 			<option value="${nn.mid }">${ nn.title}</option> 
		 		</c:otherwise>
		 	</c:choose>
		 </c:forEach>
		 </select>
		</div>
		<div class="form-group">
			<label for="poster">배너이미지</label> 
			<input accept="image/*" value="${mm.upfile }" required="required" type="file" id="poster" name="mmfile" class="form-control"/>
		</div>
	  <!-- <div class="form-group">
	    <label for="title">홍보문구</label>
	    <input type="text" class="form-control" id="title" name="title" placeholder="문구를 입력하세요"
	    maxlength="100">
	   
	  </div> -->
		 <input type="hidden" name="bid" value="${mm.bid }">
		 <input type="hidden" name="content" value="${mm.upfile }"><!-- 가져가서삭제할 올드파일 -->
	  <button type="submit" class="btn btn-default form-group">추가/수정</button>

	</form>
	</c:forEach>
</div>