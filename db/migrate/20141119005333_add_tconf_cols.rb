class AddTconfCols < ActiveRecord::Migration
  def change
    add_column :tconferences, :name, :string
    add_column :tconferences, :season, :string
    add_column :tconferences, :year, :string
    add_column :tconferences, :location, :string
    add_column :tconferences, :date, :string
    add_column :tconferences, :host, :string
  end
end
