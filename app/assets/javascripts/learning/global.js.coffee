$ ->
  $('#topic-selector ul, #session ul, .exam-history ul').hide()

  $('#topic-selector .current, #session .current, .exam-history .average-score ').mouseenter (e) ->
    $(this).next().slideDown('fast')

  $('#topic-selector, #session, .exam-history').mouseleave (e) ->
    $(this).find('ul').slideUp('fast')

