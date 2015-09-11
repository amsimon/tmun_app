class Branch < ActiveRecord::Base

  has_many :schedules
  has_many :headlines

  accepts_nested_attributes_for :schedules, allow_destroy: true

  extend FriendlyId
  friendly_id :name

  scope :travel, -> { where(name: "travelteam") }
  scope :home, -> { where(name: "tritonmun") }
  scope :college, -> { where(name: "sdimun") }


  def self.specific_branch(name)
    Branch.where(name: name).first
  end

  def specific_branch?(name)
    self.name == name
  end

  @@tritonmun_letter = "Welcome to TritonMUN!"

  def self.tritonmun_letter
    @@tritonmun_letter
  end

  def self.tritonmun_letter=(value)
    @@tritonmun_letter = value
  end

end
