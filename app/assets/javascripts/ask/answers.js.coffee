$ ->
  $(document).on 'ajax:success', '#question-show .answers .edit', (e, data) ->
    $(data).showAsModalBox()
    $('#edit-answer').validate
      rules:
        'answer[content]': 'required'

  $(document).on 'ajax:success', '#edit-answer', (e, data) ->
    answerId = $(this).data('answer-id')
    $('.modal-box').remove()
    $('#mask').hide()
    $("#question-show .answers li[data-answer-id=#{answerId}]").replaceWith data
