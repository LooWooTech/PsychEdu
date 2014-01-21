$ ->
  $('#topic-selector ul, #session ul').hide()

  $('#topic-selector .current, #session .current ').mouseenter (e) ->
    $(this).next().slideDown('fast')

  $('#topic-selector, #session').mouseleave (e) ->
    $(this).find('ul').slideUp('fast')

