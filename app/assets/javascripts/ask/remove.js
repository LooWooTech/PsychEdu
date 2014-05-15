/**
 * 监听 删除 按钮 ajax:success 事件
 */
$(document).ready(function() {
	$(document).on('ajax:success', '[data-click="remove"]', 'click', function(e) {
		$(this)
			.closest('.media')
			.hide('slow', function() {
				$(this).remove();
			});
	});
});