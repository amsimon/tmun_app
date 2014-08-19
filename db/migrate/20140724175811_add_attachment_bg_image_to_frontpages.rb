class AddAttachmentBgImageToFrontpages < ActiveRecord::Migration
  def self.up
    change_table :frontpages do |t|

      t.attachment :bg_image

    end
  end

  def self.down

    remove_attachment :frontpages, :bg_image

  end
end
