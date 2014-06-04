$(document).ready(function() {
	// 新增评论
	$('#comments-notes').delegate('form', 'ajax:success', function(e, data) {
		$(this).prev('.list').find('.media-items').prepend(data);
		$(this).find('textarea').val('');
	});
	// 分页
	$('#comments-notes').delegate('.pagination a', 'ajax:success', function(e, data) {
		$(this).closest('.list').html(data);
	});
});