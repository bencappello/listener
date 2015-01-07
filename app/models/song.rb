class Song < ActiveRecord::Base
  validates :name, presence: true, uniqueness: {scope: :blog_id}
  validates :song_type, presence: true, inclusion: { in: ["remix", "regular"] }

  belongs_to :band
  belongs_to :blog
  # has_many :favorites
  # has_many :favoriters, through: :favorites, :source: :user
end
