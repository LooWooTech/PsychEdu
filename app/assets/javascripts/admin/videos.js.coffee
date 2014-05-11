$ ->
  $('a.add-video').click (e)->
    new_video_fields = $('.video-fields li:last').clone()
    new_id = new Date().getTime()
    new_video_fields.html(new_video_fields.html().replace(/_0_/g, "_#{new_id}_"))
    new_video_fields.html(new_video_fields.html().replace(/\[0\]/g, "[#{new_id}]"))
    new_video_fields.find('input:not([name*=_destroy])').val('')
    new_video_fields.appendTo('.video-fields')
