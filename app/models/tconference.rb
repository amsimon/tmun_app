class Tconference < ActiveRecord::Base

  validates :season, presence: true
  validates :year, presence: true



  extend FriendlyId
  friendly_id :nick, use: :slugged

  def slug_candidates
    [
        [:nick, :year]
    ]
  end


end
