class Band < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :songs, inverse_of: :band, dependent: :destroy
  has_many :band_tags, dependent: :destroy
end
