class BandTag < ActiveRecord::Base
  validates :band, presence: true
  validates :tag_id, presence: true, :uniqueness => {:scope => :band_id}

  belongs_to :band, inverse_of: :band_tags
  belongs_to :tag, inverse_of: :band_tags
end
