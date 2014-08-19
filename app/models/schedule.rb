class Schedule < ActiveRecord::Base
  #attr_accesible :hconference_id, :number
  belongs_to :hconference
  has_many :events
  accepts_nested_attributes_for :events, :reject_if => lambda { |a| a[:activity].blank? }, :allow_destroy => true
  default_scope -> { order('created_at DESC') }

  #validates :hconference_id, presence: true
=begin
  validates :date, presence: true
=end


end
