class Omdb.Views.SearchMovie extends Backbone.View

  template: JST['movies/search_movie']

  # events:
  #   'click #search_movie': 'searchMovie'

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

  # searchMovie: (e)->
  # #  e.preventDefault()
  #   @searched_collection = new Omdb.Collections.SearchMovie()
  #   @searched_collection.fetch({ data: $.param({ page: 1}) })
  #   console.log 'zzzzzzzzzzzzzzzzz', @searched_collection

    # console.log $(e.currentTarget).val()
