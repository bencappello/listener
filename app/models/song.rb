class Song < ActiveRecord::Base
  validates :name, presence: true, uniqueness: {scope: :blog_id}
  validates :blog_id, :band_id, presence: true
  validates :song_type, presence: true, inclusion: { in: ["remix", "regular"] }

  has_attached_file :audio
  # :default_url => "missing.jpg",

  validates_attachment_content_type :audio,
    content_type: [
      'audio/mpeg',
      'audio/x-mpeg',
      'audio/mp3',
      'audio/x-mp3',
      'audio/mpeg3',
      'audio/x-mpeg3',
      'audio/mpg',
      'audio/x-mpg',
      'audio/x-mpegaudio' ]

  belongs_to :band
  belongs_to :blog
  has_many :song_tags, dependent: :destroy
  has_many :tags, through: :song_tags

  has_many :user_songs, dependent: :destroy
  has_many :favoriters, through: :user_songs, source: :user

  has_many :comments, as: :commentable
end
