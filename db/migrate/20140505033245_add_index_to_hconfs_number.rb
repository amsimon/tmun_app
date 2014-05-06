class AddIndexToHconfsNumber < ActiveRecord::Migration
  def change
    add_index :hconferences, :number, unique: true
  end
end
