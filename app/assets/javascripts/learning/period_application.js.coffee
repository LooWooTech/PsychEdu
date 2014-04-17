$ ->
  $('form.period-application').submit ->
    if $(this).find('[name=type]').val() is ''
      alert '请选择申请类型'
      return false
    if $(this).find('[name=start_on]').val() is ''
      alert '请输入开始日期'
      return false
    if $(this).find('[name=end_on]').val() is '' && $(this).find('[name=type]').val() isnt 'resuming'
      alert '请选择结束日期'
      return false
  .ajaxForm
    error: (xhr)->
      alert xhr.responseText
    success: (msg)->
      alert msg
      location.reload()

  $('select[name=type]').change ->
    if $(this).val() is 'resuming'
      $(this).closest('form').find('.end').hide()
    else
      $(this).closest('form').find('.end').show()
