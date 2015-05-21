Template.home.rendered = ->
  #Carousel
  $('.carousel').carousel({
    interval: 5000
  })

  # Arduino click
  currentRoad = Roads.find()
  observer = currentRoad.observeChanges
    changed: (id, fields) ->
      console.log("Home template -  road to #{fields.currentRoad}");
      # Vérifier si le stop est vraiment utile. Si oui, le généraliser.
      # Si non, trouver comment gérer le stop, si potentiellement problématique.
      observer.stop() if fields.currentRoad is "explanation"
      Router.go(fields.currentRoad) if fields.currentRoad is "explanation"