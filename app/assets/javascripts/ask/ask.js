$(document).ready(function() {
	$(document).delegate('[data-toggle="ask"]', 'click', function(e) {
		e.preventDefault();
		$.buildModal({
			remote: $(this).attr('href')
		}).render();
	});
});