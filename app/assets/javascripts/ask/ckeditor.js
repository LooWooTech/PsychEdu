//*= require ckeditor/ckeditor.js

$(document).ready(function() {

	var className = 'bootstrap-editor';

	CKEDITOR.replaceAll(function(textarea, config) {

		if ($(textarea).hasClass(className)) {

			// 工具条配置
			config.toolbar = [
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
			];

			return true;
		}
		else {
			return false;
		}
	});
});