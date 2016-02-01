class Opinion < ApplicationRecord
  belongs_to :healthcheck
  after_create_commit { OpinionBroadcastJob.perform_later self }
  validates :handle, presence: true
  validates :handle, presence: true
  validates :champion, presence: true
  validates :team, presence: true
  validates :alignment, presence: true
  validates :keeping_score, presence: true
  validates :transparency, presence: true
  validates :progress, presence: true
  validates :quality, presence: true
  validates :scrappy, presence: true
end
