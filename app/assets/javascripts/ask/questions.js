$(document).ready(function() {
	$('body').delegate('[data-event="question.new"]', 'ajax:success', function(e, data) {
		var modal = $(data).buildModal();

		// editor
		modal.find('[data-event="editor"]').editor();
	});
	$('#mainarea').delegate('[data-event="question.edit"]', 'ajax:success', function(e, data) {
		var modal = $(data).buildModal();

		// editor
		modal.find('[data-event="editor"]').editor();
	});
});