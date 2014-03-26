$(document).ready(function() {

	'use strict';

	// jQuery element
	var $element = $('.btn-modal');

	// modal template
	var modal = [
		'<div class="modal fade" id="ask-modal">',
			'<div class="modal-dialog">',
				'<div class="modal-content">',
				'</div>',
			'</div>',
		'</div>'
	].join();
  
  $element.click(function(e) {
    
    $(modal)
    	.modal({
      	remote: $(this).attr('href')
    	})
    	.appendTo($('body'));

    e.preventDefault();
  });
});