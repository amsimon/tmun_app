class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :q
      t.string :a
      t.integer :hconference_id

      t.timestamps
    end
    add_index :questions, [:hconference_id, :created_at]
  end
end
