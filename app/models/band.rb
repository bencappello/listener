class Band < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :songs, inverse_of: :band, dependent: :destroy
  has_many :band_tags, dependent: :destroy
  has_many :tags, through: :band_tags

  has_many :comments, as: :commentable
end
