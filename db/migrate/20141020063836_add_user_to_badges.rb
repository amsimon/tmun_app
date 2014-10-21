class AddUserToBadges < ActiveRecord::Migration
  def change
    add_column :badges, :user_id, :integer
  end
end
