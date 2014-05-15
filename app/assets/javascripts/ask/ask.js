$(document).ready(function() {
	$(document).delegate('[data-event="question.new"]', function(e) {
		$.buildModal({
			remote: $(this).attr('href')
		}).render();
	});
});