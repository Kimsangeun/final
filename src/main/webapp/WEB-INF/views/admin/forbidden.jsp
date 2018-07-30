<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<script type="text/javascript">
$(function(){
$("#noAdminModal").modal();

$("#noAdminModal").on('hidden.bs.modal',function(){
	history.go(-1);
});

});



</script>
<div class="modal fade" id="noAdminModal" tabindex="-1" role="dialog"
	aria-labelledby="noAdminModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="noAdminModalLabel">로그인</h4>
			</div>
			<div class="modal-body"><c:if test="${mem != null }">관리자 계정으로 </c:if>로그인 후 이용 가능합니다.</div>
			<div class="modal-footer">
				<button id="noAdminModalOk" type="button" data-dismiss="modal" class="btn btn-primary">확인</button>
			</div>
		</div>
	</div>
</div>
