(function($) {

	'use strict';

	var defaults = {
		contentClass: '.modal-content',
		template: function() {
			return [
				'<div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">',
					'<div class="modal-dialog">',
						'<div class="modal-content">',
						'</div>',
					'</div>',
				'</div>'
			].join('');
		}
	};

	var BuildModal = function(options) {
		this.options = $.extend({}, defaults, options);
	}

	BuildModal.prototype = {
		render: function() {
			// 判断 template 是函数还是字符串
			var template = $.isFunction(this.options.template) ?
				this.options.template() : this.options.template;

			this.el = $(template);

			// 绑定 modal 加入 body
			this.el
				.modal()
				.appendTo($('body'))
				.on('hidden.bs.modal', function() {
					$(this).remove();	// modal隐藏结束后销毁modal
				});
			return this;
		},
		getElement: function() {
			return this.el;
		}
	};

	$.buildModal = function(options) {
		return new BuildModal(options);
	}

	$.fn.buildModal = function(options) {
		// 实例化对象
		var buildModal = new BuildModal(options);

		// 渲染 modal，得到 modal 元素，替换 modal-content，返回 modal 对象
		var modal = buildModal
			.render()
			.getElement();

		modal
			.find(buildModal.options.contentClass)
			.html(this);

		return modal;
	}

})(jQuery);