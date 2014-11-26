class Topic < ActiveRecord::Base

  belongs_to :training
  belongs_to :hconference
  belongs_to :cconference


end
