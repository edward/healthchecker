class HealthcheckBroadcastJob < ApplicationJob
  queue_as :default

  def perform(healthcheck)
    ActionCable.server.broadcast("healthcheck_channel_#{healthcheck.handle}", message: render_healthcheck(healthcheck))
  end

  private

  def render_healthcheck(healthcheck)
    ApplicationController.renderer.render(partial: 'healthchecks/healthcheck', locals: { healthcheck: healthcheck })
  end
end
