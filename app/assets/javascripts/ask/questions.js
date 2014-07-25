$(document).ready(function() {
  $('body').delegate('[data-event="question.new"]', 'ajax:success', function(e, data) {
    var modal = $(data).buildModal();

    // editor
    modal.find('[data-event="editor"]').editor();
  });
  $('#mainarea').delegate('[data-event="question.edit"]', 'ajax:success', function(e, data) {
    var modal = $(data).buildModal();

    // editor
    modal.find('[data-event="editor"]').editor();
  });

  $('body').on('click', '.add-attachment', function(e){
    new_attachment_fields = $('.attachment-fields li:last').clone();
    new_id = new Date().getTime();
    new_attachment_fields.html(new_attachment_fields.html().replace(/_\d+_/g, "_" + new_id + "_"));
    new_attachment_fields.html(new_attachment_fields.html().replace(/\[\d+\]/g, "[" + new_id + "]"));
    new_attachment_fields.find('input:not([name*=_destroy]), textarea').val('');
    new_attachment_fields.appendTo('.attachment-fields');
  });
});
