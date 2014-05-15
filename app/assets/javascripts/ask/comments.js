$(document).ready(function() {

	$el = $('#mainarea');

	// show comments
	$el.delegate('[data-event="comment.query"]', 'ajax:success', function(e, data) {
		$(this)
			.closest('.actions')
			.toggleClass('open')
			.find('.action-comments-box')
			.html(data);
	});

	// remove comment
	$el.delegate('[data-event="comment.remove"]', 'ajax:success', function(e, data) {
		$(this)
			.closest('.media')
			.fadeOut(function() {
				$(this).remove();
			});
	});

	// publish comment
	$el.delegate('[data-event="comment.publish"]', 'ajax:success', function(e, data) {
		$(this).prev('.media-items').append(data);
		$(this).find('textarea').val('');
	});
});