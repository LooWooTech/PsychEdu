//*= require ckeditor/override
//*= require ckeditor/ckeditor

(function() {

	"use strict";

	var config = {
		toolbar: [
			[
				'Styles',
				'Bold',
				'Italic',
				'-',
				'NumberedList',
				'BulletedList',
				'Blockquote',
				'-',
				'Link',
				'Unlink',
				'-',
				'Maximize'
			]
		]
	};

	var Editor = function(el, opts) {

		config = $.extend(config, opts);

		CKEDITOR.replace(el, config);
	}

	$.fn.editor = function(opts) {
		this.each(function() {
			var editor = new Editor(this, opts);
		});
	}

})();
