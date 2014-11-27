class ChangeToText2 < ActiveRecord::Migration
  def up
    # simple and straightforward
    change_column :answers, :content, :text
  end

  # but why cant it just be:
  #   change_column :product, :long_description, :string
  # ???
  # because effin databases don't like you, that's why.
  def down

    # create a temporary column to hold the truncated values
    # we'll rename this later to the original column name
    add_column :answers, :content_temp, :string

    # use #find_each to load only part of the table into memory
    Answer.find_each do |answer|
      content_temp = answer.content

      # test if the new value will fit into the truncated field
      if answer.content.length > 255
        content_temp = product.content[0,254]
      end

      # use #update_column because it skips validations AND callbacks
      answer.update_column(:content_temp, content_temp)
    end

    # delete the old column since we have all the data safe in the
    # temp_description
    remove_column :answers, :content

    # rename the temp_column to our original column name
    rename_column :answers, :content_temp, :content
  end
end
