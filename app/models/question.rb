class Question < ActiveRecord::Base
  belongs_to :hconference
  default_scope -> { order('created_at DESC') }
  validates :hconference_id, presence: true
  validates :q, presence: true
  validates :a, presence: true

end
