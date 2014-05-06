class AddDateLocationPriceToHconferences < ActiveRecord::Migration
  def change
    add_column :hconferences, :date, :string
    add_column :hconferences, :location, :string
    add_column :hconferences, :early_price, :integer
    add_column :hconferences, :normal_price, :integer
  end
end
