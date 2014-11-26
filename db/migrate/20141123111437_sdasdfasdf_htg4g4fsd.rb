class SdasdfasdfHtg4g4fsd < ActiveRecord::Migration
  def change
    remove_column :schedules, :date
    add_column :schedules, :date, :date
  end
end
