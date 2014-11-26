class Question < ActiveRecord::Base
  #attr_accesible :hconference_id, :number
  belongs_to :faq

  has_many :answers
  accepts_nested_attributes_for :answers, allow_destroy: true

  default_scope -> { order('created_at ASC') }

  #validates :hconference_id, presence: true

=begin
    validates :q, presence: true
    validates :a, presence: true
=end


end
