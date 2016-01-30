class Opinion < ApplicationRecord
  belongs_to :healthcheck
  after_create_commit { ActionCable.server.broadcast("healthcheck_channel_#{healthcheck.handle}", message: "New opinion saved.") }
  validates :handle, presence: true
end
