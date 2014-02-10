$ ->
  $('.units').hide()
  $('#chapters .expand').click (event)->
    $(this).toggleClass('expand').toggleClass('retract').next('.units').toggle()
    if $(this).hasClass('expand')
      $(this).text('展开课程')
    else
      $(this).text('收起课程')
