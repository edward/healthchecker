class OpinionBroadcastJob < ApplicationJob
  queue_as :default

  def perform(opinion)
    ActionCable.server.broadcast("healthcheck_opinion_channel_#{opinion.healthcheck.handle}", message: render_opinion(opinion))
  end

  private

  def render_opinion(opinion)
    ApplicationController.renderer.render(partial: 'opinions/opinion', locals: { opinion: opinion })
  end
end
