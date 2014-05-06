class AddLateToHconferences < ActiveRecord::Migration
  def change
    add_column :hconferences, :late_date, :string
    add_column :hconferences, :late_price, :string
  end
end
