# Villes Ouest lyonnais =============================================

citiesArray = [
  {
    name: "CIVRIEUX D AZERGUES",
    time: 33,
    picture: "/civrieux.jpg",
    interest: "Le jardin de Nous-Deux",
    sentence: "Qui du train ou du tram est arrivé en premier ?"
  },
   {
    name: "L ARBRESLE",
    time: 33,
    picture: "/arbresle.jpg",
    interest: "Le couvent Ste-Marie de la Tourette",
    sentence: "Ya des voies ferroviaires sous Fourvière"
  },
  {
    name: "CASINO LA CROIX LAVAL",
    time: 17,
    picture: "/casino-lacroix.jpg",
    interest: "Le Casino du Lyon Vert",
    sentence: "Le contrôleur porte des chaussettes à paillettes"
  },
  {
    name: "CHAPONOST",
    time: 20,
    picture: "/chaponost.jpg",
    interest: "La rampe de l'aqueduc du Gier",
    sentence: "Le cactus de l'aiguilleur de train sent le sapin"
  },
  {
    name: "BRIGNAIS",
    time: 25,
    picture: "/brignais.jpg",
    interest: " La vieille ville de Brignais",
    sentence: "L'Ouest-Lyonnais c'est pas trou paumais"
  },
  {
    name: "CHARBONNIERE",
    time: 17,
    picture: "/charbonniere.jpg",
    interest: "Le parc de la Bressonnière",
    sentence: "Ma carte Ou'RA sent le vin"
  }

]


# seeds ====================================================================

Meteor.startup ->
  # Initialisation du compteur arbre
  if Meteor.isServer and Trees.find().count() == 0
    console.log "Inserting Tree"
    Trees.insert count: 0
  # Initialisation du routage physique
  if Meteor.isServer and Roads.find().count() == 0
    console.log "Inserting Road"
    Roads.insert currentRoad: "home"
  # Remise à zéro du routage physique :
  if Meteor.isServer
    console.log "Updating Road"
    Roads.update({}, {currentRoad: "home"})

  # Initialisation des villes disponibles dans l'application
  if Meteor.isServer and Cities.find().count() == 0
    for city in citiesArray
      do ->
        console.log "Inserting city #{city.name}"
        Cities.insert name: city.name, time: city.time, picture: city.picture, interest: city.interest, sentence: city.sentence