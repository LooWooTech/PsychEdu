$(document).ready(function() {
	$(document).delegate('[data-toggle="complaints"]', 'click', function(e) {
		e.preventDefault();
		$.buildModal({
			remote: $(this).attr('href')
		}).render();
	});
});