class User < ActiveRecord::Base
  validates :email, :username, :session_token, presence: true
  validates :password, length: { minimum: 5, allow_nil: true }
  validates :email, :username, uniqueness: true

  has_attached_file :image,
  default_url: "missing.jpg",
  styles: {profile: '200x200', nav: '-quality 40 -strip'}

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/


  has_many :user_songs, dependent: :destroy
  has_many :user_blogs, dependent: :destroy

  has_many :blogs, dependent: :destroy
  has_many :songs, dependent: :destroy

  has_many :favorite_songs, through: :user_songs, source: :song
  has_many :followed_blogs, through: :user_blogs, source: :blog
  has_many :followed_blog_songs, through: :followed_blogs, source: :songs

  has_many(
    :follow_choices,
    class_name: "UserFollow",
    foreign_key: :follower_id,
    dependent: :destroy
  )
  has_many :followed_users, through: :follow_choices, source: :followed_user
  has_many :followed_user_songs, through: :followed_users, source: :favorite_songs

  has_many(
  :followings,
  class_name: "UserFollow",
  foreign_key: :followed_user_id,
  dependent: :destroy
  )
  has_many :followers, through: :followings, source: :follower

  attr_reader :password
  after_initialize :ensure_session_token

  def image_url=(image_url)
    self.image = image_url
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(username_or_email, password)
    if user = User.find_by(username: username_or_email)
      user.try(:is_password?, password) ? user : nil
    else
      user = User.find_by(email: username_or_email)
      user.try(:is_password?, password) ? user : nil
    end
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  private

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
end
