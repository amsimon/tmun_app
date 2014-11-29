class Cconference < ActiveRecord::Base

  has_many :topics
  has_many :deadlines

  extend FriendlyId
  friendly_id :number




end
