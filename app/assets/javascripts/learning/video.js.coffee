$ ->
  $('.comments-and-notes form').on 'ajax:success', (e, data) ->
    $(this).next('.list').find('ul').prepend data
    $(this).find('textarea').val('')

  $('body').on 'ajax:success', '.comments-and-notes .pagination a', (e, data) ->
    $(this).closest('.list').replaceWith data
