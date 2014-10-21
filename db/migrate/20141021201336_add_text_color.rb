class AddTextColor < ActiveRecord::Migration
  def change
    add_column :badges, :text_color, :string
  end
end
