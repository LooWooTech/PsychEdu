$(document).ready(function() {

	'use strict';

	// modal template
	var modal = [
		'<div class="modal fade" id="ask-modal">',
			'<div class="modal-dialog">',
				'<div class="modal-content">',
				'</div>',
			'</div>',
		'</div>'
	].join();
  
  $('#ask-btn').click(function(e) {
    
    $(modal)
    	.modal({
      	remote: $(this).attr('href')
    	})
    	.appendTo($('body'));

    e.preventDefault();
  });
});