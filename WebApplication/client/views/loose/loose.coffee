Template.loose.helpers
  tree: () ->
    return Trees.findOne()

Template.loose.rendered = ->
  setTimeout (->
    $('.first-title').fadeOut()
  ), 2500
  setTimeout (->
    $('.last-title').fadeIn()
  ), 3500

  setTimeout (->
    Router.go('home')
  ), 12000