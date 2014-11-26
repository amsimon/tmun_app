class LotsOf < ActiveRecord::Migration
  def change
    add_column :schedules, :branch_id, :integer
    add_column :branches, :name, :string
  end
end
