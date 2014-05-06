class AddYearToHconference < ActiveRecord::Migration
  def change
    add_column :hconferences, :year, :integer
  end
end
