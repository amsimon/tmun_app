class ChangeTimes < ActiveRecord::Migration
  def change
    remove_column :events, :time_end
    remove_column :events, :time_start

    add_column :events, :time_end, :time
    add_column :events, :time_start, :time
  end
end
