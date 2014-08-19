class AddGreetingToFrontpages < ActiveRecord::Migration
  def change
    add_column :frontpages, :greeting, :string
  end
end
