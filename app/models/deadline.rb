class Deadline < ActiveRecord::Base

  belongs_to :cconference
  belongs_to :hconference
  belongs_to :tconference

end
