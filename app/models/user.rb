class User < ActiveRecord::Base
  validates :email, :username, :session_token, presence: true
  validates :password, length: { minimum: 5, allow_nil: true }
  validates :email, :username, uniqueness: true
  # validates_with AttachmentSizeValidator, :attributes => :image, :less_than => 1.megabytes
  # validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  has_attached_file :image,
  # :styles => { :medium => "300x300>", :thumb => "100x100>" },
  :default_url => "missing.jpg",
  :bucket => ENV["s3_bucket"]

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  # validates_attachment :image,
  #   # content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
  #   content_type: /\Aimage\/.*\Z/,
  #   file_name: { matches: [/png\Z/, /jpe?g\Z/, /gif\Z/] },
  #   size: { in: 0..1000.kilobytes }

  has_many :user_songs, dependent: :destroy
  has_many :user_blogs, dependent: :destroy
  has_many :user_follows, dependent: :destroy

  has_many :favorite_songs, through: :user_songs, source: :song
  has_many :followed_blogs, through: :user_blogs, source: :blog

  has_many(
    :follow_choices,
    class_name: "UserFollow",
    foreign_key: :follower_id,
    dependent: :destroy
  )
  has_many :followed_users, through: :follow_choices, source: :followed_user
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
    unless self.image.exists?
      self.image = image_url
    end
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    user.try(:is_password?, password) ? user : nil
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
