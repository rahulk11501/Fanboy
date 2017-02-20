class Omdb.Routers.Movies extends Backbone.Router
  routes:
    "": "index"

  initialize: ()->
    @collection = new Omdb.Collections.Movies()
    @collection.fetch()

  index: ->
    view = new Omdb.Views.MoviesIndex(collection: @collection)
    $('#movie_container').html(view.render().el)
