$(document).ready(function() {

	'use strict';

	// jQuery element
	var $element = $('.btn-modal');

	// modal template
	var modal = [
		'<div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">',
			'<div class="modal-dialog">',
				'<div class="modal-content">',
				'</div>',
			'</div>',
		'</div>'
	].join();
  
  $element.click(function(e) {
    
    var $modal = $(modal)
    	.modal({
      	remote: $(this).attr('href')
    	})
    	.appendTo($('body'))
    	// 绑定销毁事件
    	.on('hidden.bs.modal', function() {
    		$(this).remove();
    	});

    e.preventDefault();
  });
});