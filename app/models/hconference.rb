class Hconference < ActiveRecord::Base

  validates :number, presence: true
  validates :season, presence: true
  validates :year, presence: true

  #attr_accessible :q, :questions_attributes
  has_many :faqs

  accepts_nested_attributes_for :faqs, allow_destroy: true



  has_many :schedules, dependent: :destroy


  extend FriendlyId
  friendly_id :roman

  default_scope -> { order('roman DESC') }

end
