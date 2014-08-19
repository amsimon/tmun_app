class Hconference < ActiveRecord::Base

  validates :number, presence: true
  validates :season, presence: true
  validates :year, presence: true

  #attr_accessible :q, :questions_attributes
  has_many :questions, dependent: :destroy
  has_many :schedules, dependent: :destroy

  accepts_nested_attributes_for :questions, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :schedules, :reject_if => :all_blank, :allow_destroy => true

  extend FriendlyId
  friendly_id :roman

  default_scope -> { order('roman DESC') }

end
