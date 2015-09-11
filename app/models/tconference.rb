class Tconference < ActiveRecord::Base

  validates :season, presence: true
  validates :year, presence: true

  scope :fall, -> { where(season: "Fall") }
  scope :winter, -> { where(season: "Winter") }
  scope :spring, -> { where(season: "Spring") }

  extend FriendlyId
  friendly_id :nick, use: :slugged

  def slug_candidates
    [
        :nick,
        [:nick, :year]
    ]
  end


end
