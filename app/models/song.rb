class Song < ActiveRecord::Base
  include PgSearch
  paginates_per 5

  validates :name, presence: true, uniqueness: {scope: :blog_id}
  validates :user_id, :blog_id, :band_id, presence: true
  validates :song_type, presence: true, inclusion: { in: ["remix", "regular"] }

  has_attached_file :audio,
  :default_url => "http://s3.amazonaws.com/listener-dev/songs/audios/000/000/005/original/stream?1422649924"

  validates_attachment_content_type :audio,
    content_type: /\Aaudio\/.*\Z/

  has_attached_file :image,
  default_url: "missing_song.jpg",
  styles: {large: '200x200', list: '-quality 100 -strip', nav: '-quality 40 -strip'}

  validates_attachment_content_type :image,
    :content_type => /\Aimage\/.*\Z/

  belongs_to :user
  belongs_to :band
  belongs_to :blog
  has_many :song_tags, dependent: :destroy
  has_many :tags, through: :song_tags

  has_many :user_songs, dependent: :destroy
  has_many :favoriters, through: :user_songs, source: :user

  has_many :comments, as: :commentable

  pg_search_scope :search_by_title_or_band,
    against: :name,
    associated_against: { band: :name },
    :using => {
      :tsearch => {:prefix => true}
    }

  def audio_url=(audio_url)
    unless self.audio.exists?
      self.audio = audio_url
    end
  end

  def image_url=(image_url)
    unless self.image.exists?
      self.image = image_url
    end
  end

  def band_name=(band_name)
    band = Band.find_by(name: band_name)
    unless band
      band = Band.create(name: band_name)
    end
    self.band_id = band.id
  end
end
