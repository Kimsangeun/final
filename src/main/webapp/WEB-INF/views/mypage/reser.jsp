<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.info{
	float : left;
	margin: 10px;
	padding: 10px;
}
.list_{
	float : left;
	margin: 10px;
	padding: 10px;
}
._list{
	
}
</style>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	function cancel() {
		if(confirm('예매취소합니까?')){
		submit();
		}
	}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="frame">
		<div id="table_info">
			<div class="info_no">예매번호</div>
			<div class="info_resNO">영화제목</div>
			<div class="info_movie">영화시간</div>
			<div class="info_time">관</div>
			<div class="info_screen">좌석</div>
			<div class="info_seat">인원</div>
			<div class="info_cancel">..</div>
		</div>
		<c:forEach items="${ data}" var="res" varStatus="no">
		<form name="cancle" action="/proj/mypage/cancle">
		<div class="table_list">
		<input type="hidden" name="rId" value="${res.rId }">
			<div class="list_no">${no.index +1}</div>
			<div class="list_resNO">${res.rId }</div>
			<div class="list_movie">${res.title }</div>
			<div class="list_time">
			<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${res.mstart }"/>
			</div>
			<div class="list_screen">${res.scNum }</div>
			<div class="list_seat">${res.seatNum }</div>
			<div class="list_cnt">${res.cnt }</div>
			<div class="list_cancel">
				<input type="submit" value="예매취소" onclick="cancel()" >
			</div>		
		</div>
		</form>
		</c:forEach>
		
	</div>
</body>
</html>