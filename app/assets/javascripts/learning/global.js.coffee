$ ->
  $('#topic-selector ul').hide()

  $('#topic-selector .current').mouseenter (e) ->
    $(this).next().slideDown('fast')

  $('#topic-selector').mouseleave (e) ->
    $(this).find('ul').slideUp('fast')
