#*= require jquery-ui
#*= require jquery-ui/i18n/jquery.ui.datepicker-zh-CN
$ ->
  $.datepicker.setDefaults($.datepicker.regional['zh-CN'])

  if !Modernizr.inputtypes.date
    $('input[type=date]').datepicker
      dateFormat: 'yy-mm-dd'
