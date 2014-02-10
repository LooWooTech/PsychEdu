$ ->
  $('.exam-history ul').hide()

  $('.exam-history .average-score ').mouseenter (e) ->
    $(this).next().slideDown('fast')

  $('.exam-history').mouseleave (e) ->
    $(this).find('ul').slideUp('fast')

  #new
  $('#account .menu').hide()

  $('#account').mouseenter (e) ->
    $(this).find('.menu').show()

  $('#account').mouseleave (e) ->
    $(this).find('.menu').hide()

  $('.current-topic-learning .switcher ul').hide()
  $('.current-topic-learning .switcher').mouseenter (e) ->
    $(this).find('ul').show()

  $('.current-topic-learning .switcher').mouseleave (e) ->
    $(this).find('ul').hide()
    
