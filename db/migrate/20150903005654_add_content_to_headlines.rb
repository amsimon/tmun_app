class AddContentToHeadlines < ActiveRecord::Migration
  def change
    add_column :headlines, :content, :text
  end
end
