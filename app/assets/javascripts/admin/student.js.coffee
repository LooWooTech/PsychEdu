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
          $(form).find('legend').after("<ul class='errors'>#{xhr.responseText}</ul>")
        success: (path) ->
          location.pathname = path
      false

  $('#edit-student').validate
    rules:
      "student[account_attributes][username]": 'required'
      "student[name]": 'required'
      "student[account_attributes][password]": 'required'
      "student[account_attributes][password_confirmation]": 'required'
      "student[gender]": 'required'
      "student[unit_code]": 'required'
    messages:
      "student[account_attributes][username]":
        'required': '请输入用户名'
      "student[account_attributes][password]":
        'required': '请输入密码'
      "student[account_attributes][password_confirmation]":
        'required': '请确认密码'
      "student[name]":
        'required': '请输入姓名'
      "student[gender]":
        'required': '请选择性别'
      "student[unit_code]":
        'required': '请输入单位编码'
