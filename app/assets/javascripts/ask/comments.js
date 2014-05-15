$(document).ready(function() {

	$el = $('#mainarea');

	// show comments
	$el.delegate('[data-event="comments"]', 'click', function(e) {
		e.preventDefault();

		var $this = $(this),
			$action = $this.parent().parent();

		if ($action.hasClass('open')) {
			$action.removeClass('open');
		}
		else {
			$action.addClass('open');
			// 获得 ajax
			$.get($this.attr('href'), function(data) {
				var $comments = $(data);
				$action.find('.action-comments-box').html($comments);
			});
		}
	});

	// remove comment
	$el.delegate('[data-event="remove"]', 'ajax:success', function(e, data) {
		$(this)
			.closest('.media')
			.fadeOut('slow', function() {
				$(this).remove();
			});
	});

	// publish comment
	$el.delegate('[data-event="comment.publish"]', 'ajax:success', function(e, data) {
		$(this).prev('.media-items').append(data);
		$(this).find('textarea').val('');
	});
});