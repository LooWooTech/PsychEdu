$ ->
  $('a.add-attachment').click (e)->
    new_attachment_fields = $('.attachment-fields li:nth(0)').clone()
    new_id = new Date().getTime()
    new_attachment_fields.html(new_attachment_fields.html().replace(/_0_/g, "_#{new_id}_"))
    new_attachment_fields.html(new_attachment_fields.html().replace(/\[0\]/g, "[#{new_id}]"))
    new_attachment_fields.find('input:not([name*=_destroy])').val('')
    new_attachment_fields.appendTo('.attachment-fields')
