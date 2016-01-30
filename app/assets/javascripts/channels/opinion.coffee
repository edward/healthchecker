healthcheck_handle = $(window.location.pathname.split('/')).get(-1)

App.opinion = App.cable.subscriptions.create {channel: "OpinionChannel", healthcheck_handle: healthcheck_handle},
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    alert(data['message'])

  # speak: ->
  #   @perform 'speak'
