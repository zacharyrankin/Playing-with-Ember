#
#= require /lib/jquery-1.10.2.js
#= require /lib/handlebars-1.1.2.js
#= require /lib/ember-1.5.0.js
#= require /lib/ember-data.min.js
#= require_directory templates/
#
App = Ember.Application.create()
App.ApplicationAdapter = DS.FixtureAdapter.extend()
App.Product = DS.Model.extend
  title: DS.attr()
  image: DS.attr()

App.Product.FIXTURES = [
  {
    id: 1,
    title: 'Hello',
    image: 'https://avatars2.githubusercontent.com/u/321407?s=460'
  },
  {
    id: 2,
    title: 'Hello 2',
    image: 'https://avatars2.githubusercontent.com/u/321407?s=460'
  },
  {
    id: 3,
    title: 'Hello 3',
    image: 'https://avatars2.githubusercontent.com/u/321407?s=460'
  },
  {
    id: 4,
    title: 'Hello 4',
    image: 'https://avatars2.githubusercontent.com/u/321407?s=460'
  }
]

App.Router.map ->
  @.route 'about'
  @.resource 'products', ->
    @.resource 'product',
      path: '/:product_id'

App.ProductsRoute = Ember.Route.extend
  model: ->
    @store.findAll 'product'

App.ProductRoute = Ember.Route.extend
  model: (params) ->
    @store.find 'product', params.product_id

App.ProductsIndexController = Ember.Controller.extend
  name: 'Zachary'

App.IndexController = Ember.Controller.extend
  name: 'Zachary'
  class: 'hero'
  time: (->
    (new Date()).toDateString()
  ).property()
