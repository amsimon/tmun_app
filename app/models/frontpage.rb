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

  @@home_title = "Inspire"
  @@home_text = "Design a high school conference from the ground up."
  @@home_link_text = 'MORE'
  @@home_link_url = '/tritonmun'

  @@travel_title = "Debate"
  @@travel_text = "Travel with our team and compete against other schools."
  @@travel_link_text = 'MORE'
  @@travel_link_url = '/travelteam'

  @@collegiate_title = "Lead"
  @@collegiate_text = "Help organize a conference, chair a debate, or conduct a crisis committee."
  @@collegiate_link_text = 'MORE'
  @@collegiate_link_url = '/tritonmun'


  def self.travel_title
    @@travel_title
  end

  def self.travel_text
    @@travel_text
  end

  def self.travel_link_text
    @@travel_link_text
  end

  def self.travel_link_url
    @@travel_link_url
  end

  def self.travel_title=(value)
    @@travel_title = value
  end

  def self.travel_text=(value)
    @@travel_text = value
  end

  def self.travel_link_text=(value)
    @@travel_link_text=(value)
  end

  def self.travel_link_url=(value)
    @@travel_link_url = value
  end

  #####

  def self.home_title
    @@home_title
  end

  def self.home_text
    @@home_text
  end

  def self.home_link_text
    @@home_link_text
  end

  def self.home_link_url
    @@home_link_url
  end

  def self.home_title=(value)
    @@home_title = value
  end

  def self.home_text=(value)
    @@home_text = value
  end

  def self.home_link_text=(value)
    @@home_link_text = value
  end

  def self.home_link_url=(value)
    @@home_link_url = value
  end

  ######

  def self.collegiate_title
    @@collegiate_title
  end

  def self.collegiate_text
    @@collegiate_text
  end

  def self.collegiate_link_text
    @@collegiate_link_text
  end

  def self.collegiate_link_url
    @@collegiate_link_url
  end


  def self.collegiate_title=(value)
    @@collegiate_title = value
  end

  def self.collegiate_text=(value)
    @@collegiate_text = value
  end

  def self.collegiate_link_text=(value)
    @@collegiate_link_text = value
  end

  def self.collegiate_link_url=(value)
    @@collegiate_link_url = value
  end


  #######



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
