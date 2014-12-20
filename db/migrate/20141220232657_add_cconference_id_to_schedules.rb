class AddCconferenceIdToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :cconference_id, :integer
  end
end
