class Branch < ActiveRecord::Base

  has_many :schedules
  has_many :headlines

  accepts_nested_attributes_for :schedules, allow_destroy: true

  extend FriendlyId
  friendly_id :name

  scope :travel, -> { where(name: "Travel") }
  scope :home, -> { where(name: "Home") }


  def self.specific_branch(name)
    Branch.where(name: name).first
  end

end
