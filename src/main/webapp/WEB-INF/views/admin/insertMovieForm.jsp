<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<script type="text/javascript">
        $(document).ready(function(){
         
            // 스틸컷추가 버튼 클릭시
            var i = 1;
            $(".addBtn").live("click", function(){
            	
                var clickedRow = $(this).parent().parent();
                var cls = clickedRow.attr("class");
                

                var newrow = clickedRow.clone();
                //alert(newrow);
                newrow.find("td:eq(1)").find('input[type="file"]').attr("name","steelcuts["+i+"]");
                newrow.find("td:eq(0)").remove();           
                newrow.insertAfter($("#movieClass ."+cls+":last"));

                console.log("네임 : "+ newrow.find("td:eq(0)").find('input[type="file"]').attr("name"));

                // rowspan 조정
                resizeRowspan(cls);
                i = i+1;
                console.log(i);
               
            });
             
             
            // 삭제버튼 클릭시
            $(".delBtn").live("click", function(){
            	alert('클리크');
                var clickedRow = $(this).parent().parent();
                var cls = clickedRow.attr("class");
                 
                // 각 항목의 첫번째 row를 삭제한 경우 다음 row에 td 하나를 추가해 준다.
                if( clickedRow.find("td:eq(0)").attr("rowspan") ){
                    if( clickedRow.next().hasClass(cls) ){
                        clickedRow.next().prepend(clickedRow.find("td:eq(0)"));
                    }
                }
 
                clickedRow.remove();
 
                // rowspan 조정
                resizeRowspan(cls);
            });
 
            // cls : rowspan 을 조정할 class ex) item1, item2, ...
            function resizeRowspan(cls){
                var rowspan = $("."+cls).length;
                $("."+cls+":first td:eq(0)").attr("rowspan", rowspan);
            }
        });
    </script>

<div class="container" style="padding-top:50px">
<form action="insertMovie" method="post" enctype="multipart/form-data" accept-charset="UTF-8" >
	<table id="movieClass" class="table table-hover">
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
		<tr class="item1">
			<td>스틸컷
			<button type="button" class="addBtn btn btn-default">+</button></td>
			<td><input type="file" name="steelcuts[0]" /></td>
		</tr>
		<tr>
			<td>줄거리</td>
			<td><textarea style="resize: vertical;" class="form-control" rows="5" name="plot" cols="20">줄거리</textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input class="btn btn-default" type="submit" value="추가" />
			</td>
		</tr>
	</table>
</form>
</div>
