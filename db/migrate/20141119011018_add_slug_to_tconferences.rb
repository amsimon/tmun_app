class AddSlugToTconferences < ActiveRecord::Migration
  def change
    add_column :tconferences, :slug, :string
    add_index :tconferences, :slug
  end
end
