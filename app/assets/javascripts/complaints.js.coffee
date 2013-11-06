$ ->
  $(document).on 'ajax:success', '#question-show a.complain', (e, data) ->
    $(data).showAsModalBox()

  $(document).on 'ajax:success', '#complaint-form', (e, data) ->
    alert data
    $('.modal-box').remove()
    $('#mask').hide()
