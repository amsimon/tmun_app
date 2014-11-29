class CreateDeadlines < ActiveRecord::Migration
  def change
    create_table :deadlines do |t|

      t.timestamps
    end
  end
end
