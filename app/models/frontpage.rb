class Frontpage < ActiveRecord::Base
  has_attached_file :bg_image, :styles => {
      :tiny => "25x25",
      :small  => "150x150",
      :medium => "960x640" },
                    :default_url => "/assets/default_slide_:style.png"
  validates_attachment_content_type :bg_image, :content_type => /\Aimage\/.*\Z/

  @@hello = "As a club, we aim to develop a globally aware and socially concerned community by expanding students' understanding of pertinent social, economic and political issues."
  @@hello_link_text = "Learn how you can participate"
  @@hello_link_url = "/participate"


  def self.hello
    @@hello
  end

  def self.hello=(value)
    @@hello = value
  end

  def self.hello_link_text
    @@hello_link_text
  end

  def self.hello_link_text=(value)
    @@hello_link_text = value
  end

  def self.hello_link_url
    @@hello_link_url
  end

  def self.hello_link_url=(value)
    @@hello_link_url = value
  end


end
