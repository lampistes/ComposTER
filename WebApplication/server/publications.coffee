# Début de définition de publications
# (mais le package meteor autopublish est toujours intégré)

Meteor.publish 'tree', () ->
  Trees.find { }, {limit: 1}

Meteor.publish 'road', () ->
  Roads.find { }, {limit: 1}

Meteor.publish 'city', (id) ->
  Roads.find {_id: id }
