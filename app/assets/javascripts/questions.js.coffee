  
$ ->
  showModalBox = (content)->
    $('#mask').show()
    $('body').append content
    left = $('body').width()/2 - content.width()/2
    content.css(left: left)

  validateQuestion = ->
    $('#question-form form').validate
      rules:
        'question[title]': 'required'
        'question[content]': 'required'
    

  $('#ask').on 'ajax:success', (xhr, data)->
    showModalBox $(data)
    validateQuestion()
          

  $('body').on 'click', '#question-form .close', ->
    $('#question-form').remove()
    $('#mask').hide()

  $('#question-show .question .actions .edit').on 'ajax:success', (xhr, data) ->
    showModalBox $(data)
    validateQuestion()

