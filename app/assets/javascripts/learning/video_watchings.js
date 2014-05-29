$(document).ready(function() {
	// 新增评论
	$('#comments-notes [data-event="video.commentnote.publish"]').on('ajax:success', function(e, data) {
		$(this).prev('.list').find('.media-items').prepend(data);
		$(this).find('textarea').val('');
	});
	// 分页
	$('body').delegate('#comments-notes .pagination a', 'ajax:success', function(e, data) {
		$(this).closest('.list').html(data);
	});
});