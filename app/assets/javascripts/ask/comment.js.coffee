$ ->
  $('#question-show').on 'ajax:success', '.new-comment', (e, data)->
    $(this).prev('ul').prepend data
    $(this).find('textarea').val('')

  $('#question-show .question .actions a.comments').click ->
    if $('#question-show #content > .comments').size() == 0
      $.get $(this).attr('href'), (data)->
        $('#question-show #content .question').after data
    else
      $('#question-show #content > .comments').toggle()
      
    false

  $('#question-show #content').on 'ajax:success', '.comments .delete', (e, data) ->
    $(this).closest('li').fadeOut('fast')


  $('#question-show .answers .actions a.comments').click ->
    parent = $(this).closest('li')
    if parent.find('> .comments').size() == 0
      $.get $(this).attr('href'), (data)->
        parent.append data
    else
      parent.find('> .comments').toggle()
      
    false
