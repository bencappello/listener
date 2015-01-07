class Band < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :songs, inverse_of: :band, dependent: :destroy
