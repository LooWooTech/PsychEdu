$ ->
  $('.comments-and-notes form').on 'ajax:success', (e, data) ->
    $(this).prev('.list').find('ul').prepend data
    $(this).find('textarea').val('')

  $('body').on 'ajax:success', '.comments-and-notes .pagination a', (e, data) ->
    $(this).closest('.list').replaceWith data

  $('.comments-and-notes .switcher div').click ->
    $('.comments-and-notes .switcher .current').removeClass('current')
    $('.comments-and-notes > div:not(.switcher)').hide()
    $('.comments-and-notes').find(".#{$(this).addClass('current').data('control')}").show()

  $('.comments-and-notes .switcher .comments').click()

  $('.unit-selector ul').hide()
  $('.unit-selector').mouseenter (e) ->
    $(this).find('ul').show()

  $('.unit-selector').mouseleave (e) ->
    $(this).find('ul').hide()

    
