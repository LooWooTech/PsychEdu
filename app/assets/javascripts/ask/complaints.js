$(document).ready(function() {
	$('#mainarea').delegate('[data-event="complaints"]', 'ajax:success', function(e, data) {
		var modal = $(data).buildModal();
	});
});