class ChangeToDate < ActiveRecord::Migration
  remove_column :events, :date
end
