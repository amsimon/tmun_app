class Headline < ActiveRecord::Base
  validates :order, uniqueness: true
  default_scope order(order: :asc)


end
