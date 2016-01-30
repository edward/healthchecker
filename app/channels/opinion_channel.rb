# Be sure to restart your server when you modify this file. Action Cable runs in an EventMachine loop that does not support auto reloading.
class OpinionChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "healthcheck_channel_#{params[:healthcheck_handle]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # def speak
  #   ActionCable
  # end
end
