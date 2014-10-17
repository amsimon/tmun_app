class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|

      t.timestamps
      t.string :name
      t.string :color
    end
  end
end
