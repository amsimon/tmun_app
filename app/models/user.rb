class User < ActiveRecord::Base
  has_many :microposts, dependent: :destroy
  before_save { self.email = email.downcase }
  before_create :create_remember_token

  validates :name,  presence: true, length: { maximum: 50 }
  validates :bio, length: { maximum: 500 }

  has_many :badges

  has_attached_file :avatar, :styles => {
      :tiny => "25x25",
      :small  => "150x150",
      :medium => "300x300>" },
      :default_url => "/assets/default_avatar_:style.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, length: { minimum: 6 },
            :if => :password

  def self.secretariat_members
    User.where(secretariat: true)
  end

  def self.non_secretariat_members
    User.where(secretariat: false)
  end

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end
  
  def feed
    # This is preliminary. See "Following users" for the full implementation.
    Micropost.where("user_id = ?", id)
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  def create_remember_token
    self.remember_token = User.digest(User.new_remember_token)
  end


end
