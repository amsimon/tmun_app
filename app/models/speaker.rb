class Speaker < ActiveRecord::Base
  belongs_to :hconference
  belongs_to :cconference

  def first_name
    self.name.split.first.downcase
  end

  def last_name
    self.name.split.last.downcase
  end
end
