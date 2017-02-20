class Omdb.Views.MoviesIndex extends Backbone.View

  template: JST['movies/index']

  events:
    'click #search_movie': 'searchMovie'

  initialize: ->
    @collection.on('sync', @render, this)

  render: ->
    $(this.el).html(this.template())
    this.collection.each(this.appendMovie)
    this


  appendMovie: (movie, index)->
    view = new Omdb.Views.Movie(model: movie, index: index)
    if index==0 or index%4==0
      $('#movies').append('<div class="row"></div>')
    $('#movies').find('.row:last').append(view.render().el)

  searchMovie: ->
    @searched_collection = new Omdb.Collections.SearchMovie()
    search_text = $('#search_text').val()
    @searched_collection.fetch({ data: $.param({ search_text: search_text}) })
    view = new Omdb.Views.MoviesIndex(collection: @searched_collection)
    $('#container').html(view.render().el)
    

   appendSearchedMovie: (collection)->
    $(this.el).html()
    $(this.el).html(this.template())
    collection.each(this.appendMovie)
    this
