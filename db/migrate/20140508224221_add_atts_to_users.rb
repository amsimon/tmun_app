class AddAttsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :secretariat, :boolean, default: false
    add_column :users, :sec_pos, :string, default: "none"
    add_column :users, :travel_team, :boolean, default: false
    add_column :users, :home_team, :boolean, default: false
    add_column :users, :bio, :string
  end
end
