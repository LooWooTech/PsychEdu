$ ->
  $('a.add-banner').click (e)->
    new_banner_fields = $('.banner-fields li:last').clone()
    new_id = new Date().getTime()
    new_banner_fields.html(new_banner_fields.html().replace(/_\d+_/g, "_#{new_id}_"))
    new_banner_fields.html(new_banner_fields.html().replace(/\[\d+\]/g, "[#{new_id}]"))
    new_banner_fields.find('input:not([name*=_destroy])').val('')
    new_banner_fields.appendTo('.banner-fields')
