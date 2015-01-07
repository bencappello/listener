class Blog < ActiveRecord::Base
  validates :name, :url, presence: true, uniqueness: true

  has_many :songs
  # has_many :favorites
  # has_many :favoriters, through: :favorites, :source: :user
end
