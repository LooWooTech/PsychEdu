$ ->
  $.fn.showAsModalBox = ->
    $('#mask').show()
    $('body').append this
    left = $('body').width()/2 - @width()/2
    @css(left: left)
  
    hide = =>
      $(this).remove()
      $('#mask').hide()
  
    @find('.close').click hide
