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
	width: 100px;
	height:50px;
}

.list{
	float : left;
	margin: 10px;
	padding: 10px;
	width: 100px;
	height:50px;
}	

</style>

<script type="text/javascript">

	var now = new Date();

function cancel(rId) {
	
	var ss = $("#mstart"+rId).text().trim();
	
	var yy = ss.substring(0,4);
	var MM = ss.substring(5,7);
	var dd = ss.substring(8,10);
	var HH = ss.substring(11,13);
	var mm = ss.substring(14,16);
	
	var start = new Date(yy,MM-1,dd);
	start.setHours(HH,mm,0,0);

	var gap = (start.getTime()-now.getTime())/1000/60;
	
	if(0<=gap&& gap<=30){
		alert('시작30분전내로는 예매취소하실수 없습니다.')
	}else if(gap<0){
		alert('지난예매는 취소하실 수 없습니다.');	
	}else{
		if(confirm('예매를 취소하시겠습니까?')){
			$("#cancle"+rId).submit();
		}
	}
		
}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table id="frame" class="table table-hover">
		<tr id="table_info">
			<th class="info_no1 infotd">번호</th>
			<th class="info_no infotd">예매번호</th>
			<th class="info_resNO infotd">영화제목</th>
			<th class="info_movie infotd">영화시간</th>
			<th class="info_time infotd">관</th>
			<th class="info_screen infotd">좌석</th>
			<th class="info_seat infotd">인원</th>
			<th class="info_cancel infotd">취소</th>
		</tr>
		<c:forEach items="${ data}" var="res" varStatus="no">
		<tr class="table_list" >
		<form id="cancle${res.rId }" action="/proj/mypage/cancle">
		<input type="hidden" id="rId" name="rId" value="${res.rId }">
			<td class="list_no listtd">${no.index +1}</td>
			<td class="list_resNO listtd">${res.rId }</td>
			<td class="list_movie listtd">${res.title }</td>
			<td class="list_time listtd" id="mstart${res.rId }">
			<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${res.mstart }"/>
			</td>
			<td class="list_screen listtd">${res.scNum }</td>
			<td class="list_seat listtd">${res.seatNum }</td>
			<td class="list_cnt listtd">${res.cnt }</td>
			<td class="list_cancel listtd">
				<input type="button" value="예매취소" onclick="cancel(${res.rId})" >
			</td>
		</form>
		</tr>
		</c:forEach>
	</table>
</body>
</html>