<script type="text/javascript">
$(function(){
$("#noLoginModal").modal();

$("#noLoginModal").on('hidden.bs.modal',function(){
	history.go(-1);
});

});
</script>