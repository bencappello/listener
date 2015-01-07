class Song < ActiveRecord::Base
  validates :name, presence: true, uniqueness: {scope: :blog_id}
  validates :blog_id, :band_id, presence: true
  validates :song_type, presence: true, inclusion: { in: ["remix", "regular"] }

  belongs_to :band
  belongs_to :blog
  has_many :song_tags, dependent: :destroy
  has_many :tags, through: :song_tags
  # has_many :favorites
  # has_many :favoriters, through: :favorites, :source: :user
end
