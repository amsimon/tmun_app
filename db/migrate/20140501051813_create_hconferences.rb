class CreateHconferences < ActiveRecord::Migration
  def change
    create_table :hconferences do |t|
      t.string :season
      t.integer :number

      t.timestamps
    end
  end
end
