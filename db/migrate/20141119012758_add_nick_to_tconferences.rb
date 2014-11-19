class AddNickToTconferences < ActiveRecord::Migration
  def change
    add_column :tconferences, :nick, :string
  end
end
