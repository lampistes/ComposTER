Template.win.rendered = ->
  setTimeout (->
    $('.first-title').fadeOut()
  ), 2500
  setTimeout (->
    $('.last-title').fadeIn()
  ), 3500


  setTimeout (->
    Router.go('home')
  ), 15000