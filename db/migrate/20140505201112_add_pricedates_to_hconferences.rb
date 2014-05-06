class AddPricedatesToHconferences < ActiveRecord::Migration
  def change
    add_column :hconferences, :early_date, :string
    add_column :hconferences, :normal_date, :string
  end
end
