Router.route "/",
  controller: 'ApplicationController'
  name: "home"
  template: "home"
  # waitOn: ->
  #   Meteor.subscribe 'tree'
  #   Meteor.subscribe 'road'

Router.route "/explanation",
  controller: 'ApplicationController'
  name: "explanation"
  template: "explanation"


Router.route "/game",
  controller: 'ApplicationController'
  name: "game"
  template: "game"
  waitOn: ->
    Meteor.subscribe 'tree'

class @ApplicationController extends RouteController


Router.route "/win/:_id",
  controller: 'EndApplicationController'
  name: "win"
  template: "win"


Router.route "/loose/:_id",
  controller: 'EndApplicationController'
  name: "loose"
  template: "loose"

class @EndApplicationController extends RouteController
  waitOn: ->
    Meteor.subscribe 'city', @params._id
  data: ->
    Cities.findOne _id: @params._id
  onStop: -> Meteor.call 'resetRoad'