class Healthcheck < ApplicationRecord
  has_many :opinions
  before_validation :handle
  after_update_commit { HealthcheckBroadcastJob.perform_later self }

  validates! :handle, presence: true

  def handle
    if attributes['handle'].blank?
      assign_attributes(handle: SecureRandom.uuid)
    end

    super
  end
end
