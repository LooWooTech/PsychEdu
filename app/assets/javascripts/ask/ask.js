$(document).ready(function() {

	$('.btn-modal').showModal(function(modal) {
		$(modal).on('shown.bs.modal', function() {
			// 添加绑定事件检查 Form validation
		});
	});

});