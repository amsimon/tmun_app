class Event < ActiveRecord::Base
  #attr_accesible :hconference_id, :number
  belongs_to :schedule
  default_scope { order(date: :asc, time_start: :asc) }

  #validates :schedule_id, presence: true
=begin
  validates :time_start, presence: true
  validates :time_end, presence: true
  validates :activity, presence: true
  validates :place, presence: true
=end


end
