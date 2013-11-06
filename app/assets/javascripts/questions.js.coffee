$ ->
  validateQuestion = ->
    $('#question-form').validate
      rules:
        'question[title]': 'required'
        'question[content]': 'required'
    

  $('#ask').on 'ajax:success', (e, data)->
    $(data).showAsModalBox()
    validateQuestion()

  $('#question-show .question .actions .edit').on 'ajax:success', (e, data) ->
    $(data).showAsModalBox()
    validateQuestion()

