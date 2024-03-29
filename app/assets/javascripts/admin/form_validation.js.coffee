$ ->
  $.validator.setDefaults
    ignore: 'input[type=date]'

  $('#open-topic-learning').validate
    rules:
      'topic_learning[learning_periods_attributes][0][start_on]': 'required'
      'topic_learning[learning_periods_attributes][0][end_on]': 'required'
    messages:
      'topic_learning[learning_periods_attributes][0][start_on]':
        'required': '请输入开始日期'
      'topic_learning[learning_periods_attributes][0][end_on]':
        'required': '请输入结束日期'
    submitHandler: (form) ->
      $(form).ajaxSubmit
        error: (xhr) ->
          $(form).find('.errors').remove()
          $(form).find('legend').after("<ul class='errors'>#{xhr.responseText}</ul>")
        success: (path) ->
          location.pathname = path
      false

  $('form[id^=edit_student]').validate
    rules:
      'student[account_attributes][username]': 'required'
      'student[name]': 'required'
      'student[account_attributes][password_confirmation]':
        'equalTo': '[name="student[account_attributes][password]"]'
      'student[unit_code]': 'required'
    messages:
      'student[account_attributes][username]':
        'required': '请输入用户名'
      'student[account_attributes][password_confirmation]':
        'equalTo': '两次密码输入不一致'
      'student[name]':
        'required': '请输入姓名'
      'student[unit_code]':
        'required': '请输入单位编码'

  $('#new_student').validate
    rules:
      'student[account_attributes][username]': 'required'
      'student[name]': 'required'
      'student[account_attributes][password]': 'required'
      'student[account_attributes][password_confirmation]':
        'equalTo': '[name="student[account_attributes][password]"]'
      'student[unit_code]': 'required'
    messages:
      'student[account_attributes][username]':
        'required': '请输入用户名'
      'student[account_attributes][password]':
        'required': '请输入密码'
      'student[account_attributes][password_confirmation]':
        'equalTo': '两次密码输入不一致'
      'student[name]':
        'required': '请输入姓名'
      'student[unit_code]':
        'required': '请输入单位编码'

  $('#edit-topic').validate
    rules:
      'topic[name]': 'required'
    messages:
      'topic[name]':
        'required': '请输入专题名'

  $('#edit-chapter').validate
    rules:
      'chapter[name]': 'required'
    messages:
      'chapter[name]':
        'required': '请输入章节名'

  $('#edit-unit').validate
    rules:
      'unit[name]': 'required'
    messages:
      'unit[name]':
        'required': '请输入单元名'

  $('#edit-topic-testing').validate
    rules:
      'topic_testing[topic_id]': 'required'
      'topic_testing[title]': 'required'
    messages:
      'topic_testing[topic_id]':
        'required': '请选择专题'
      'topic_testing[title]':
        'required': '请输入题目'


  $('#edit-case-analysis').validate
    rules:
      'case_analysis[topic_id]': 'required'
      'case_analysis[title]': 'required'
    messages:
      'case_analysis[topic_id]':
        'required': '请选择专题'
      'case_analysis[title]':
        'required': '请输入标题'

  $('#edit-forum-catalog').validate
    rules:
      'forum_catalog[name]': 'required'
    messages:
      'forum_catalog[name]':
        'required': '请输入名称'

  $('#edit-forum').validate
    rules:
      'forum[name]': 'required'
    messages:
      'forum[name]':
        'required': '请输入名称'

  $('#edit-announcement').validate
    rules:
      'announcement[title]': 'required'
    messages:
      'announcement[title]':
        'required': '请输入标题'

  $('#edit-article').validate
    rules:
      'article[title]': 'required'
      'article[type]': 'required'
    messages:
      'article[title]':
        'required': '请输入标题'
      'article[type]':
        'required': '请选择类型'

  $('#new_administrator').validate
    rules:
      'administrator[account_attributes][username]': 'required'
      'administrator[account_attributes][password]': 'required'
      'administrator[account_attributes][password_confirmation]':
        'equalTo': '[name="administrator[account_attributes][password]"]'
    messages:
      'administrator[account_attributes][username]':
        'required': '请输入用户名'
      'administrator[account_attributes][password]':
        'required': '请输入密码'
      'administrator[account_attributes][password_confirmation]':
        'equalTo': '两次密码输入不一致'

  $('form[id^=edit_administrator]').validate
    rules:
      'administrator[account_attributes][username]': 'required'
      'administrator[account_attributes][password_confirmation]':
        'equalTo': '[name="administrator[account_attributes][password]"]'
    messages:
      'administrator[account_attributes][username]':
        'required': '请输入用户名'
      'administrator[account_attributes][password_confirmation]':
        'equalTo': '两次密码输入不一致'

  if $('#review-topic-exam').size() > 0
    $('#review-topic-exam').validate()

    $('#review-topic-exam .score').each (i, e) ->
      $(e).rules 'add',
        messages:
          max: "不能超过 {0} 分"
