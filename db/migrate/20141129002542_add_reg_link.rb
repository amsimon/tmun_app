class AddRegLink < ActiveRecord::Migration
  def change
    add_column :cconferences, :reg_url, :text
    add_column :hconferences, :reg_url, :text

    add_column :deadlines, :cconference_id, :integer
    add_column :deadlines, :hconference_id, :integer
    add_column :deadlines, :tconference_id, :integer
  end
end
