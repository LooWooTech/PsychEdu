$(document).ready(function() {
	$('body').delegate('[data-event="question.new"]', 'ajax:success', function(e, data) {
		$(data).buildModal();
	});
	$('#mainarea').delegate('[data-event="question.edit"]', 'ajax:success', function(e, data) {
		$(data).buildModal();
	});
});