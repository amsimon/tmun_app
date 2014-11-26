class Faq < ActiveRecord::Base


  belongs_to :hconference
  has_many :questions

  accepts_nested_attributes_for :questions, allow_destroy: true

  def self.specific_faq(owner, name)
    owner.faqs.where(name: name).first
  end

end
