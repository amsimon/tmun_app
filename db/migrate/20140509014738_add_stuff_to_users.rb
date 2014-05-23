class AddStuffToUsers < ActiveRecord::Migration
  def change
    add_column :users, :grad_year, :string
    add_column :users, :major, :string
  end
end
