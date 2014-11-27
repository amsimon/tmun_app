class AddLetterToBranches < ActiveRecord::Migration
  def change
    add_column :branches, :letter, :text
  end
end
