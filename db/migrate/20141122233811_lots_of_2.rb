class LotsOf2 < ActiveRecord::Migration
  def change
    add_column :events, :date, :date
  end
end
