<div id="modal-qrcode" class="modal fade in" tabindex="-1" role="dialog" aria-hidden="false" style="display: none;">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- Modal Header -->
			<div class="modal-header text-center">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h2 class="modal-title"><i class="fa fa-qrcode"></i> 门店二维码</h2>
			</div>
			<!-- END Modal Header -->
			<!-- Modal Body -->
			<div class="modal-body">
				<img src="about:blank" id="qrcode" class="img-responsive"/>
			</div>
			<!-- END Modal Body -->
		</div>
	</div>
</div>
<script>
(function($){
$().ready(function(){
	$('#modal-qrcode').on('shown.bs.modal', function(event){
		var $ralated = $(event.relatedTarget);
		$('#qrcode').attr('src', '<{'static/img/loading.gif'|url}>').attr('src', '<{'qrcode/store'|url}>?id=' + $ralated.data('sid'));
	});
});
})(jQuery);
</script>