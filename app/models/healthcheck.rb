class Healthcheck < ApplicationRecord
  before_validation :handle

  validates! :handle, presence: true

  def handle
    if attributes['handle'].blank?
      assign_attributes(handle: SecureRandom.uuid)
    end

    super
  end
end
