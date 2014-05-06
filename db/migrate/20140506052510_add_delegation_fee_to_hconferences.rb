class AddDelegationFeeToHconferences < ActiveRecord::Migration
  def change
    add_column :hconferences, :delegation_fee, :integer
  end
end
