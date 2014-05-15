$(document).ready(function() {

	$('#mainarea').delegate('[data-event="answer.edit"]', 'ajax:success', function(e, data) {
		var modal = $(data).buildModal();

		// TODO: 绑定提交按钮
	});

});