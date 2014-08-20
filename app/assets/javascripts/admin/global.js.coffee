$ ->
  $('body > .navbar .navbar-nav .dropdown').each (i, m)->
    if $(m).find('.dropdown-menu > li').size() == 0
      $(m).hide()
      
