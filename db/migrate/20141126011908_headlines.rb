class Headlines < ActiveRecord::Migration
  def change
    add_column :headlines, :title, :text
    add_column :headlines, :link_text, :string
    add_column :headlines, :order, :integer
    add_column :headlines, :branch_id, :integer
  end
end