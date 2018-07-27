<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<h4 class="modal-title" id="noAdminModalLabel">관리자</h4>
			</div>
			<div class="modal-body">관리자 계정만 이용 가능합니다.</div>
			<div class="modal-footer">
				<button id="noAdminModalOk" type="button" data-dismiss="modal" class="btn btn-primary">확인</button>
			</div>
		</div>
	</div>
</div>
