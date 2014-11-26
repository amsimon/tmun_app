class Training < ActiveRecord::Base

  has_many :topics

  accepts_nested_attributes_for :topics, allow_destroy: true

  default_scope -> { order(date: :asc) }

  @@time = "6-8pm Thursdays, 1-3pm Sundays"
  @@location = "Asante 123 AD, International House"


  def self.time
    @@time
  end

  def self.location
    @@location
  end

  def self.time=(value)
    @@time = value
  end

  def self.location=(value)
    @@location = value
  end



end
