class CreateCconferences < ActiveRecord::Migration
  def change
    create_table :cconferences do |t|

      t.timestamps
    end
  end
end
