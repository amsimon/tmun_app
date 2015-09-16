class Cconference < ActiveRecord::Base
  has_many :faqs


  accepts_nested_attributes_for :faqs, allow_destroy: true



  has_many :schedules, dependent: :destroy

  has_many :topics
  has_many :deadlines

  has_many :speakers


  extend FriendlyId
  friendly_id :number




end
