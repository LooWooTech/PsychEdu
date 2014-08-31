$ ->
  $('body > .navbar .navbar-nav .dropdown').each (i, m)->
    if $(m).find('.dropdown-menu > li').size() == 0
      $(m).hide()
  $('table input[type=checkbox].check-all').click (e) ->
    if $(this).is(':checked')
      $(this).closest('table').find('input[type=checkbox]:unchecked').prop('checked', true)
    else
      $(this).closest('table').find('input[type=checkbox]:checked').prop('checked', false)
