$ ->
  $('a.add-choice').click (e)->
    new_choice_fields = $('.choice-fields li:last').clone()
    new_id = new Date().getTime()
    new_choice_fields.html(new_choice_fields.html().replace(/_\d+_/g, "_#{new_id}_"))
    new_choice_fields.html(new_choice_fields.html().replace(/\[\d+\]/g, "[#{new_id}]"))
    new_choice_fields.find('input:not([name*=_destroy])').val('')
    new_choice_fields.find(':checked').prop('checked', false)
    new_choice_fields.appendTo('.choice-fields')
