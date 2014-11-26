class Sdfkjsddd < ActiveRecord::Migration
  def change

    remove_column :questions, :a
    remove_column :questions, :q

    remove_column :questions, :hconference_id

    add_column :questions, :faq_id, :integer
    add_column :questions, :content, :string

    add_column :answers, :content, :string
    add_column :answers, :question_id, :integer

    add_column :faqs, :name, :string
    add_column :faqs, :hconference_id, :integer
  end
end
