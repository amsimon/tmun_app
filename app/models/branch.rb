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

  @@training_when = "6-8pm Thursdays, 1-3pm Sundays"
  @@training_where = "Asante 123 AD, International House"


  def self.training_when
    @@training_when
  end

  def self.training_where
    @@training_where
  end

  def self.training_when=(value)
    @@training_when = value
  end

  def self.training_where=(value)
    @@training_where = value
  end

  @@tritonmun_letter = "Welcome to TritonMUN!"
  @@tritonmun_letter_top = "Welcome to TritonMUN!"
  @@tritonmun_letter_bottom = "Welcome to TritonMUN!"

  def self.tritonmun_letter
    @@tritonmun_letter
  end
  def self.tritonmun_letter_top
    @@tritonmun_letter_top
  end
  def self.tritonmun_letter_bottom
    @@tritonmun_letter_bottom
  end

  def self.tritonmun_letter=(value)
    @@tritonmun_letter = value
  end
  def self.tritonmun_letter_top=(value)
    @@tritonmun_letter_top = value
  end
  def self.tritonmun_letter_bottom=(value)
    @@tritonmun_letter_bottom = value
  end

end
