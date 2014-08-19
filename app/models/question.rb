class Question < ActiveRecord::Base
  #attr_accesible :hconference_id, :number
  belongs_to :hconference
  default_scope -> { order('created_at DESC') }

  #validates :hconference_id, presence: true

=begin
    validates :q, presence: true
    validates :a, presence: true
=end


end
