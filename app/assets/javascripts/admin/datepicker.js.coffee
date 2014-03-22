$ ->
  $.datepicker.setDefaults($.datepicker.regional['zh-CN'])

  if !Modernizr.inputtypes.date
    $('input[type=date]').datepicker
      dateFormat: 'yy-mm-dd'
