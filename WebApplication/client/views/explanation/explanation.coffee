Template.explanation.rendered = ->
  currentRoad = Roads.find()

  # cf commentaires dans home.coffee
  observer = currentRoad.observeChanges
    changed: (id, fields) ->
      console.log("Explanation template -  road to #{fields.currentRoad}");
      observer.stop()
      Router.go(fields.currentRoad);