<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

타입1
<!-- enctype="multipart/form-data" -->
<!-- <form action="insertMovie" method="post" enctype="multipart/form-data" accept-charset="UTF-8" > -->
	<table border="">
		<tr>
			<td>타이틀</td>
			<td>${data.title }</td>
		</tr>
		<tr>
			<td>국가</td>
			<td>${data.nation }</td>
		</tr>
		<tr>
			<td>장르</td>
			<td>${data.genre }</td>
		</tr>
		<tr>
			<td>런타임</td>
			<td>${data.runtime }</td>
		</tr>
		<tr>
			<td>상영등급</td>
			<td>${data.rating }</td>
		</tr>
		<tr>
			<td>감독</td>
			<td>${data.director }</td>
		</tr>
		<tr>
			<td>배우</td>
			<td>${data.actor }</td>
		</tr>
		<tr>
			<td>개봉일</td>
			<td>${data.release }</td>
		</tr>
		
		<tr>
			<td>포스터</td>
			<td>${data.poster }</td>
		</tr>
		<tr>
			<td>스틸컷1</td>
			<td>${data.steelcut }</td>
		</tr>
		<!-- <tr>
			<td>스틸컷2</td>
			<td><input type="file" name="steelcut2" /></td>
		</tr> -->
		<tr>
			<td>줄거리</td>
			<td>${data.plot }</td>
		</tr>
		<tr>
			<!-- <td colspan="2" align="center">
				<input type="submit" value="추가" />
			</td> -->
		</tr>
	</table>
<!-- </form> -->


</body>
</html>