class Omdb.Collections.SearchMovie extends Backbone.Collection

  url: '/movie/search_movie'
  parse: (data)->
    data.Search
