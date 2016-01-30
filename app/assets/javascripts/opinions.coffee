# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'click', '[data-rating-param]', (event) ->
  dataRatingParam = $(event.target).attr('data-rating-param')
  dataRatingValue = $(event.target).attr('data-rating-value')
  $("#opinion_#{dataRatingParam}").val(dataRatingValue)

  event.preventDefault()
