class Opinion < ApplicationRecord
  belongs_to :healthcheck
  after_create_commit { OpinionBroadcastJob.perform_later self }
  validates :handle, presence: true
end
