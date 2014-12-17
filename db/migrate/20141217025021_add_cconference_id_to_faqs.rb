class AddCconferenceIdToFaqs < ActiveRecord::Migration
  def change
    add_column :faqs, :cconference_id, :integer
  end
end
