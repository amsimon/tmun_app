class Hconference < ActiveRecord::Base
  has_many :questions, dependent: :destroy

  extend FriendlyId
  friendly_id :roman

  default_scope -> { order('roman DESC') }
end
