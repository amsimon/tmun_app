class AddRomanToHconferences < ActiveRecord::Migration
  def change
    add_column :hconferences, :roman, :string
  end
end
