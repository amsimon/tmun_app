class Hconference < ActiveRecord::Base
  has_many :questions, dependent: :destroy

  extend FriendlyId
  friendly_id :number

  default_scope -> { order('number DESC') }
end
