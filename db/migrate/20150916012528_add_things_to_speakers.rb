class AddThingsToSpeakers < ActiveRecord::Migration
  def change
    add_column :speakers, :title, :text
    add_column :speakers, :cconference_id, :integer
    add_column :speakers, :hconference_id, :integer
  end
end
