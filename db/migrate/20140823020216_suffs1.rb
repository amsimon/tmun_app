class Suffs1 < ActiveRecord::Migration
  def change
    add_column :frontpages, :image_url, :string
  end
end
