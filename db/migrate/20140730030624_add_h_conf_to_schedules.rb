class AddHConfToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :hconference_id, :integer
  end
end
