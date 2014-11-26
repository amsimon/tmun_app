class Sjahfgakhfweak < ActiveRecord::Migration
  def change
    add_column :topics, :committee, :text
    add_column :topics, :topic, :text
    add_column :topics, :image_url, :text
    add_column :topics, :guide_filename, :text
    add_column :topics, :chair, :string
    add_column :topics, :vice_chair, :string
    add_column :topics, :description, :text
    add_column :topics, :training_id, :integer
    add_column :topics, :hconference_id, :integer
    add_column :topics, :cconference_id, :integer

    add_column :trainings, :date, :date


  end
end
