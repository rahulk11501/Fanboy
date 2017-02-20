window.Omdb =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    @review_collection = new Omdb.Collections.Reviews()
    _this = this
    @review_collection.fetch({
      success: ->
        new Omdb.Routers.Movies()
        Backbone.history.start()
    })
    # search_view = new Omdb.Views.SearchMovie()
    # $('#search_container').html(search_view.render().el)
    # Call a different function here
    # $('#search_movie').on 'click', ->
    #   $.ajax
    #     url: '/movie/search_movie'
    #     data: {name: $('#search_text').val()}
    #     success: ->
    #       _this.searched_collection = new Omdb.Collections.SearchMovie()
    #       _this.searched_collection.fetch()
    #       view = Omdb.Views.MoviesIndex(collection: _this.searched_collection)
    #       $('#movie_container').html(view.searchedMovie().el)

$(document).ready ->
  Omdb.initialize()
