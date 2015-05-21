
Meteor.methods
  # Détermine au hasard (1 chance sur 5) si le joueur a gagné ou perdu.
  # Renvoie :
  # - le résultat du jeu (win / loose)
  # - l'id de la ville sur laquelle le jeu s'est arreté
  randomResult: (cityName) ->
    currentCity = Cities.findOne({name: cityName})
    randomNumber = Math.floor(Math.random() * 5) + 1
    result = if randomNumber is 1 then 'win' else 'loose'
    return {
      result: result,
      cityId: currentCity._id
    }
  # ... Je n'arrive plus à me rappeler si la méthode est vraiment utilisée / utile
  # Ou juste un résidu de développement. Vérifier son appel lors d'un prochain lancement.
  resetRoad: ->
    console.log "resetRoad method call"
    Roads.update({}, {currentRoad: "home"})


