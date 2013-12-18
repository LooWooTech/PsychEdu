$ ->
  $('#video-comment').on 'ajax:success', (e, data) ->
    $('.comments-and-notes .comments ul').prepend data
    $(this).find('textarea').val('')

  $('body').on 'ajax:success', '.comments .pagination a', (e, data) ->
    $('.comments .list').replaceWith data
