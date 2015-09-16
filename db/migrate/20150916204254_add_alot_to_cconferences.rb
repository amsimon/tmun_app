class AddAlotToCconferences < ActiveRecord::Migration
  def change
    add_column :cconferences, :early_date, :string
    add_column :cconferences, :early_price, :string
    add_column :cconferences, :normal_date, :string
    add_column :cconferences, :normal_price, :string
    add_column :cconferences, :late_date, :string
    add_column :cconferences, :late_price, :string
  end
end
