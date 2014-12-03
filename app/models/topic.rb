class Topic < ActiveRecord::Base

  belongs_to :training
  belongs_to :hconference
  belongs_to :cconference

  validates :order, uniqueness: true
  default_scope order(order: :asc)


end
