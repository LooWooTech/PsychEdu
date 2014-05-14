(function($) {

	'use strict';

	var defaults = {
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
		/**
		 * 获得 html 模板，可定制 html 模板
		 * html 模板支持 function 或 string 生成
		 */
		_template: function(html) {
			var template = html ? html : this.options.template;
			return $.isFunction(template) ? template() : template;
		},
		/**
		 * 渲染 modal 并加入到 body 中
		 * 绑定必要的事件
		 * 返回 modal 对象
		 */
		render: function() {
			if (!this.el) this.build();

			this.el
				.modal(this.options)
				.appendTo($('body'))
				.on('hidden.bs.modal', function() {
					$(this).remove();	// modal隐藏结束后销毁modal
				});
			return this;
		},
		/**
		 * 创建 jQuery element
		 */
		build: function(html) {
			this.el = $(this._template(html));
			return this;
		}
	};

	$.buildModal = function(options) {
		return new BuildModal(options);
	}

})(jQuery);