class Omdb.Views.Detail extends Backbone.View
  className: 'modal-dialog modal-md'
  template: JST['movies/details']
  events: ->
    'click #submit_review': 'submitReview'

  render: ->
    $(this.el).html(@template(movie: @model))
    this

  submitReview: ->
    @review_collection = Omdb.review_collection
    attributes =
      title: @model.get('Title'),
      review: $('#review_text').val()
    @review_collection.create attributes,
      wait: true
      success: ->
        $('#app').append('<div class="alert alert-success fade in alert-dismissable notify"><a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">×</a><strong>Success!</strong>      "Review Submitted"</div>')
        $('.modal').modal('toggle')
      error: @handleError

  handleError: ->
    $('#app').append('<div class="alert alert-danger fade in alert-dismissable notify"><a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">×</a><strong>Error!</strong>"Review not Submitted"</div>')
