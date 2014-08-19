class CreateFrontpages < ActiveRecord::Migration
  def change
    create_table :frontpages do |t|
      t.string :side
      t.string :bg_color
      t.string :title
      t.string :description
      t.string :link_href
      t.string :link_text

      t.timestamps
    end
  end
end
