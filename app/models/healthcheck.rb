class Healthcheck < ApplicationRecord
  has_many :opinions
  before_validation :handle
  after_update_commit { HealthcheckBroadcastJob.perform_later self }

  DIMENSIONS = [:champion, :team, :alignment, :keeping_score, :transparency, :progress, :quality, :scrappy]

  validates! :handle, presence: true

  def handle
    if attributes['handle'].blank?
      assign_attributes(handle: SecureRandom.uuid)
    end

    super
  end

  def finished?
    locked?
  end

  def results
    scores = {}
    opinions.each do |opinion|
      DIMENSIONS.each do |dimension|
        scores[dimension] ||= []
        scores[dimension] << opinion.public_send(dimension)
        scores[dimension]
      end
    end

    average = {}
    lowest = {}
    DIMENSIONS.each do |dimension|
      average[dimension] = scores[dimension].compact.reduce(:+) / scores[dimension].compact.count
      lowest[dimension] = scores[dimension].compact.reduce do |lowest_score, other_score|
        lowest_score <= other_score ? lowest_score : other_score
      end
    end

    # This makes a zillion db selects. How to group?
    # average = {}
    # lowest = {}
    # DIMENSIONS.each do |dimension|
    #   average[dimension] = opinions.average(dimension)
    #   lowest[dimension] = opinions.minimum(dimension)
    # end

    {
      average: average,
      lowest: lowest
    }
  end
end
