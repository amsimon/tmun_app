class AddPortToUsers < ActiveRecord::Migration
  def change
    add_column :users, :portrait_url, :text
  end
end
