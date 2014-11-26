class Schedule < ActiveRecord::Base
  #attr_accesible :hconference_id, :number
  belongs_to :hconference
  belongs_to :branch

  has_many :events
  accepts_nested_attributes_for :events, :reject_if => lambda { |a| a[:activity].blank? }, :allow_destroy => true
  default_scope -> { order('created_at DESC') }

  #validates :hconference_id, presence: true
=begin
  validates :date, presence: true
=end

  def self.specific_schedule(owner, name)
    owner.schedules.where(name: name).first
  end
end
