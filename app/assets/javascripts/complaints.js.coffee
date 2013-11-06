$ ->
  $('#question-show .question .actions .complaints').on 'ajax:success', (e, data) ->
    $(data).showAsModalBox()

  $(document).on 'ajax:success', '#complaint-form', (e, data)-> 
    alert data
    $('.modal-box').remove()
    $('#mask').hide()
