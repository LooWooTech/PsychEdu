(function() {

	// 定义模板
	var defaults = {};

	defaults.template = [
		'<div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">',
			'<div class="modal-dialog">',
				'<div class="modal-content">',
				'</div>',
			'</div>',
		'</div>'
	].join();

	// 类
	var showModal = function(el, callback, options) {

		var that = this;

		this.$el = $(el);

		// 配置默认值
		if (options) {
			defaults = $.extend(defaults, options);
		}

		// 绑定点击事件
		this.$el.click(function(e) {
		  
		  var modal = $(defaults.template)
		  	.modal({
		    	remote: that.$el.attr('href')
		  	})
		  	.appendTo($('body'))
		  	// modal隐藏结束后销毁modal
		  	.on('hidden.bs.modal', function() {
		  		$(this).remove();
		  	});

		  // 回调函数
		  callback.apply(this, modal);

		  e.preventDefault();
		});
	};

	// showModal 接口
	$.fn.showModal = function(callback, options) {
		return new showModal(this, callback, options);
	}

})();