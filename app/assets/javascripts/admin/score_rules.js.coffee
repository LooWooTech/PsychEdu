$ ->
  $('a.add-rule').click (e)->
    new_rule_fields = $('.rule-fields li:last').clone()
    new_id = new Date().getTime()
    new_rule_fields.html(new_rule_fields.html().replace(/_\d+_/g, "_#{new_id}_"))
    new_rule_fields.html(new_rule_fields.html().replace(/\[\d+\]/g, "[#{new_id}]"))
    new_rule_fields.find('input:not([name*=_destroy]), textarea').val('')
    new_rule_fields.appendTo('.rule-fields')
