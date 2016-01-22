class Healthcheck < ApplicationRecord
  has_many :opinions
  before_validation :handle

  validates! :handle, presence: true

  def handle
    if attributes['handle'].blank?
      assign_attributes(handle: SecureRandom.uuid)
    end

    super
  end
end
