$(document).ready(function() {

	$('#mainarea').delegate('[data-event="answer.edit"]', 'ajax:success', function(e, data) {
		var modal = $(data).buildModal();

		// publish edited answer
		modal.delegate('[data-event="answer.publish"]', 'ajax:success', function(e, data) {
			var id = $(this).data('event-id');
			$('#mainarea .media[data-answer-id="'+ id +'"]').replaceWith(data);
			modal.modal('hide');
		});

		// editor
		modal.find('[data-event="editor"]').editor();
	});

});