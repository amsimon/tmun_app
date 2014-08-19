class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :time_start
      t.string :time_end
      t.string :activity
      t.string :place
      t.timestamps
    end
  end
end
