class CreateTconferences < ActiveRecord::Migration
  def change
    create_table :tconferences do |t|

      t.timestamps
    end
  end
end
