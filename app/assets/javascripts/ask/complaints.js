$(document).ready(function() {
	// $('#mainarea').delegate('[data-event="complaints"]', 'click', function(e) {
	// 	e.preventDefault();
	// 	$.buildModal({
	// 		remote: $(this).attr('href')
	// 	}).render();
	// });

	$('#mainarea').delegate('[data-event="complaints"]', 'ajax:success', function(e, data) {
		console.log(data);
	});
});