class ChangeToText < ActiveRecord::Migration
    def up
      change_column :answers, :content, :text
    end
    def down
      # This might cause trouble if you have strings longer
      # than 255 characters.
      change_column :answers, :content, :string
    end
end
