$(document).ready(function() {
	$(document).delegate('[data-toggle="comments"]', 'click', function(e) {

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
});