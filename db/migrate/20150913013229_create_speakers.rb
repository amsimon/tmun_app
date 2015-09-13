class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.text :portrait_url
      t.text :name
      t.text :committee_name
      t.text :bio

      t.timestamps
    end
  end
end
