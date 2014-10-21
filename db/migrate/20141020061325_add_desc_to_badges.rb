class AddDescToBadges < ActiveRecord::Migration
  def change
    add_column :badges, :desc, :string
  end
end
