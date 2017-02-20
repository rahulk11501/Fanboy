class Omdb.Views.Movie extends Backbone.View
  className: 'col-md-3'
  template: JST['movies/movie']
  events:
    'click #show_details': 'showDetails'

  initialize: (options)->
    @index = options.index

  render: ->
    console.log '@index', @index
    $(@el).html(@template(movie: @model, index: @index))
    this

  showDetails: (e)->
    e.preventDefault()
    modalview = new Omdb.Views.Detail(model: @model)
    $('#movie_details').html(modalview.render().el)
    $('#movie_details').modal('show')
