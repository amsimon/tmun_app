class AddStuffToCc < ActiveRecord::Migration
  def change
    add_column :cconferences, :location, :text
    add_column :cconferences, :delegation_fee, :text
    add_column :cconferences, :early, :text
    add_column :cconferences, :regular, :text
    add_column :cconferences, :late, :text
  end
end
