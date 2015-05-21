Template.game.helpers
  tree: () ->
    return Trees.findOne()
  cities: () ->
    Cities.find()
  # 1er essai : on tombe sur une ville choisi complètement au hasard.
  # Finalement j'ai réussi à mieux faire.
  randomCity: () ->
    randomFromCollection(Cities)


Template.game.events
  # Simulation des conséquences d'un lançage de déchet, si pas d'arduino
  'click [data-action=launch]': (event, template) ->
    tree = Trees.findOne()
    Trees.update({_id: tree._id}, {$inc: {count: +1}})


Template.game.rendered = ->
  # Launch cities flip -----------------------------------------------------
  $('.flip').ticker()

  # Auto flip -------------------------------------------------------
  interval = setInterval ()->
    $('.flip').trigger('click');
  ,2000

  # Sound -----------------------------------------------------------
  # Pour palier aux comportements erratiques des différents navigateurs,
  # relance automatique en js du lecteur audio
  soundElement = document.getElementById('sound')
  soundElement.play()
  soundElement.addEventListener 'ended', (->
    @currentTime = 0
    @play()
    return
  ), false

  # Compteur arbre --------------------------------------------------
  # Captation du lançage de déchet
  tree = Trees.find()

  observer = tree.observeChanges
    changed: (id, fields) ->
      console.log "tree change !"

      # On fige le 'flip'
      clearTimeout(interval)
      # On récupère le nom de la ville sur laquelle le jeu s'est figé
      cityName = $("[data-cityname]").data('cityname').trim()

      # Détermination du résultat (win / loose) et passage aux écrans de fin
      randomResultCallback = (error, data) ->
        setTimeout (->
          console.log "Callback result"
          if error
            console.log error
          else
            console.log(data.result)
            Router.go(data.result, {_id: data.cityId})
          return
        ), 1500

      Meteor.call 'randomResult', cityName, randomResultCallback



# Methodes pour choisir une ville au hasard (non utile actuellement)----

randomInRange = (min, max) ->
  random = Math.floor(Math.random() * (max - min + 1)) + min
  random

randomFromCollection = (C) ->
  c = C.find().fetch()
  i = randomInRange(0, c.length)
  c[i]