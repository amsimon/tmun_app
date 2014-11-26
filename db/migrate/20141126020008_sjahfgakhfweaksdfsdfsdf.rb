class Sjahfgakhfweaksdfsdfsdf < ActiveRecord::Migration
  def change
    remove_column :headlines, :link_text
    add_column :headlines, :button_text, :string
    add_column :headlines, :button_url, :string
  end
end
