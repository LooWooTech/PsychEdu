$ ->
  $('#open-topic-learning').validate
    rules: 
      "topic_learning[learning_periods_attributes][0][start_on]": 'required'
      "topic_learning[learning_periods_attributes][0][end_on]": 'required'
    messages:
      "topic_learning[learning_periods_attributes][0][start_on]":
        'required': '请输入开始日期'
      "topic_learning[learning_periods_attributes][0][end_on]":
        'required': '请输入结束日期'

    submitHandler: (form) ->
      $(form).ajaxSubmit
        error: (xhr) ->
          $(form).find('.errors').remove()
          $(form).prepend("<ul class='errors'>#{xhr.responseText}</ul>")
        success: (path) ->
          location.pathname = path
      false
