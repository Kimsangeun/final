<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.infoDiv{
	float : left;
	margin: 10px;
	padding: 10px;
	width: 100px;
	height:50px;
	box-sizing: border-box;
	border: 1px solid #f00;
}
.listDiv{
	float : left;
	margin: 10px;
	padding: 10px;
	width: 100px;
	height:50px;
	box-sizing: border-box;
	border: 1px solid #f00;
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
		<div id="table_info" style="border: 1px solid;width:1000px;height: 60px">
			<div class="info_no1 infoDiv">번호</div>
			<div class="info_no infoDiv">예매번호</div>
			<div class="info_resNO infoDiv">영화제목</div>
			<div class="info_movie infoDiv">영화시간</div>
			<div class="info_time infoDiv">관</div>
			<div class="info_screen infoDiv">좌석</div>
			<div class="info_seat infoDiv">인원</div>
			<div class="info_cancel infoDiv">..</div>
		</div>
		<div class="table_list"  style="border: 1px solid;width:1000px; height:100%;">
		<c:forEach items="${ data}" var="res" varStatus="no">
		<form name="cancle" action="/proj/mypage/cancle">
		
		<input type="hidden" name="rId" value="${res.rId }">
			<div class="list_no listDiv">${no.index +1}</div>
			<div class="list_resNO listDiv">${res.rId }</div>
			<div class="list_movie listDiv">${res.title }</div>
			<div class="list_time listDiv">
			<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${res.mstart }"/>
			</div>
			<div class="list_screen listDiv">${res.scNum }</div>
			<div class="list_seat listDiv">${res.seatNum }</div>
			<div class="list_cnt listDiv">${res.cnt }</div>
			<div class="list_cancel listDiv">
				<input type="submit" value="예매취소" onclick="cancel()" >
			</div>		
		
		</form>
		</c:forEach>
		</div>
	</div>
</body>
</html>