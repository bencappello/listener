class BandTag < ActiveRecord::Base
  validates :band_id, :tag_id, presence: true

  belongs_to :band, inverse_of: :band_tags
  belongs_to :tag, inverse_of: :band_tags
end
