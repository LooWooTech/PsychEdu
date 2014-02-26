$ ->

  submitAnswers = ->
    $('.submitted').val(1)
    $('form').submit()

  format_countdown = (seconds) ->
    abs = Math.abs(seconds)
    h = abs/60/60
    m = (h % 1) * 60
    s = (m % 1) * 60
    $('#countdown .rest').text "#{if seconds < 0 then '-' else ''}#{Math.floor h}:#{Math.floor m}:#{Math.floor s}"

  seconds = $('.rest').text()
  format_countdown seconds

  if $('#countdown').size() > 0
    setInterval ->
      if seconds > 0
        format_countdown seconds -= 1
      else
        submitAnswers()
    ,1000

  $('#unit-exam .mark').click (e)->

    $('.choice-questions > li').each (index, li) ->
      if $(li).find('input:checked').size() is 0
        $(li).addClass('unfinished')

    $('body, html').animate(scrollTop: $('.unfinished:nth(0)').position().top, 'fast')


  $('.choice-questions li input').change (e)->
    $(this).closest('.unfinished').removeClass('unfinished')
    $.post $('form').attr('action'), $('form').serialize()

  $('.submit').click (e) ->
    if confirm('是否交卷？')
      submitAnswers()

