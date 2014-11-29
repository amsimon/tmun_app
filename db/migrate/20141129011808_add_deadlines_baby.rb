class AddDeadlinesBaby < ActiveRecord::Migration
  def change
    add_column :deadlines, :date, :datetime
    add_column :deadlines, :content, :text
  end
end
