class AddStuffSdf < ActiveRecord::Migration
  def change
    add_column :cconferences, :number, :integer
    add_column :cconferences, :season, :string
    add_column :cconferences, :year, :string
    add_column :cconferences, :date, :string
  end
end
