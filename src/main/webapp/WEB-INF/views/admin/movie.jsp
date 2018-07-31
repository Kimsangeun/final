<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    

<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="http://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<style>


</style>

<script>
$(function() {
	$(".deadlineGo").click(function() {
    	var mid = $(this).prop('title');
    	console.log(mid);

    	var godata={mid:mid};
    	$.ajax({
            async: false,
            type : 'POST',
            data : godata,
            url : "/proj/ajax/deadlineChk",
            success : function(data) {
                if (data.chk > 0) {
                	$("#noDeleteModal").modal();

                } else {
                	location.href="/proj/admin/deadlineReg?mid="+mid;
                    //document.getElementById('reviewInsert').submit();
                }
            },
            error : function(error) {
                
                alert("error : " + error);
            }
        }); 
    	
    });
 	
	$(".deleteGo").click(function() {
		var mid = $(this).prop('title');
    	console.log(mid);
    	var godata={mid:mid};
    	
    	$.ajax({
            async: false,
            type : 'POST',
            data : godata,
            url : "/proj/ajax/deadlineChk",
            success : function(data) {
                if (data.chk > 0) {
                	$("#noDeleteModal").modal();

                } else {
                	location.href='/proj/admin/deleteMovie?mid='+mid;
                }
            },
            error : function(error) {
                
                alert("error : " + error);
            }
        });
    	
    });
});
</script>
<!-- 삭제막기 모달~~~ -->
	<div class="modal fade" id="noDeleteModal" tabindex="-1" role="dialog"
		aria-labelledby="noDeleteModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="noLoginModalLabel">삭제 불가</h4>
				</div>
				<div class="modal-body">상영시간표에 영화가 존재합니다.</div>
				<div class="modal-footer">
					<button id="noDeleteModalOk" type="button" data-dismiss="modal" class="btn btn-primary">확인</button>
				</div>
			</div>
		</div>
	</div>

<div class="page-header">
  <h1>영화관리 <small></small></h1>
</div>
<div class="container">
<!-- <input type="button" value="추가" onclick="location.href='insertMovieForm'"> -->
<table class="table table-hover" >

	<thead>	
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>런타임</th>
		<th>개봉일</th>
		<th>마감</th>
		<th>변경</th>
		<th>삭제</th>
		<!-- <td>날짜</td> -->
	</tr>	
	</thead>
	<tbody>
<c:forEach items="${data['movie'] }" var="mm" varStatus="no">
	<tr>
		<td>${mm.mid}</td>
		<td><a href="/proj/movie/detailMovie?mid=${mm.mid }">${mm.title}</a></td>
		<td>${mm.runtime}</td><!--  onclick="location.href='deadlineReg?mid=${mm.mid}' onclick="location.href='deleteMovie?mid=${mm.mid}'-->
		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${mm.release}"/></td>
		<td>
		<c:choose>
			<c:when test="${mm.deadline eq 1 }">
				<input id="deadline" title="${mm.mid }" disabled="disabled"  class="btn btn-info" type="button" value="마감">
			</c:when>
			<c:otherwise>
				<input id="deadline" title="${mm.mid }"  class="btn btn-info deadlineGo" type="button" value="마감">
			</c:otherwise>
		</c:choose>
		
		</td>
		<td><input class="btn btn-warning" type="button" value="수정" onclick="location.href='modifyForm?mid=${mm.mid }'"></td>
		<td><input id="deleteBtn" title="${mm.mid }" class="btn btn-danger deleteGo" type="button" value="X" ></td>
	</tr>
</c:forEach>

</tbody>
</table>
<button type="button" class="btn btn-danger pull-right" onclick="location.href='insertMovieForm'">추가</button>
<div class="center-block">
<nav>
  <ul class="pagination">
  	<c:if test="${startPage >1 }">
	<li><a href="movie?page=1" aria-label="Previous"><span aria-hidden="true">[처음]</span></a></li>
	<li>
      <a href="movie?page=${startPage-1 }" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
	</c:if>
    <%-- <li>
      <a href="movie?page=${startPage-1 }" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li> --%>
    
    <c:forEach var="i" begin="${startPage }" end="${endPage }">
	    <c:choose>
			<c:when test="${i==page }">
				<li class="active"><a href="#">${i }</a></li>
			</c:when>
			<c:otherwise>
				<li class=""><a href="movie?page=${i }">${i }</a></li>
			</c:otherwise>
		</c:choose>
    </c:forEach>
    <c:if test="${endPage<totalPage}">
    <li>
      <a href="movie?page=${endPage+1 }" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
    <li>
      <a href="movie?page=${totalPage }" aria-label="Next">
        <span aria-hidden="true">마지막</span>
      </a>
    </li>
    </c:if>
  </ul>
</nav>

</div>

</div>