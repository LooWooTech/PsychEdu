$ ->
  if $('#topic-assignment').size() > 0 
    $('#administrator_roles_expert').click (e)->
      if $(this).is(':checked')
        $('#topic-assignment').show()
      else
        $('#topic-assignment').hide()
