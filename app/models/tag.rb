class Tag < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :blog_tags, dependent: :destroy
  has_many :band_tags, dependent: :destroy
  has_many :song_tags, dependent: :destroy
end
