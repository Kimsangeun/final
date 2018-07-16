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
<form action="insertMovie" method="post" enctype="multipart/form-data" accept-charset="UTF-8" >
	<table border="">
		<tr>
		
			<td>타이틀</td>
			<td><input type="text" name="title" /></td>
		</tr>
		<tr>
			<td>국가</td>
			<td><input type="text" name="nation" /></td>
		</tr>
		<tr>
			<td>장르</td>
			<td><input type="text" name="genre" /></td>
		</tr>
		<tr>
			<td>런타임</td>
			<td><input type="text" name="runtime" /></td>
		</tr>
		<tr>
			<td>상영등급</td>
			<td><input type="text" name="rating" /></td>
		</tr>
		<tr>
			<td>감독</td>
			<td><input type="text" name="director" /></td>
		</tr>
		<tr>
			<td>배우</td>
			<td><input type="text" name="actor" /></td>
		</tr>
		<tr>
			<td>개봉일</td>
			<td><input type="date" name="release" /></td>
		</tr>
		
		<tr>
			<td>포스터</td>
			<td><input type="file" name="poster1" /></td>
		</tr>
		<tr>
			<td>스틸컷1</td>
			<td><input type="file" name="steelcut1" /></td>
		</tr>
		<tr>
			<td>스틸컷2</td>
			<td><input type="file" name="steelcut2" /></td>
		</tr>
		<tr>
			<td>줄거리</td>
			<td><textarea name="plot" rows="5" cols="20">줄거리</textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="추가" />
			</td>
		</tr>
	</table>
</form>


</body>
</html>