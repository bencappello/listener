class Band < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :songs, inverse_of: :band, dependent: :destroy
  has_many :band_tags, dependent: :destroy
  has_many :tags, through: :band_tags

  def update_tags(new_tag_ids)
    new_tag_ids.delete("")
    new_tag_ids.map!(&:to_i)
    old_tag_ids = self.tags.pluck(:id)
    ids_to_add = new_tag_ids - old_tag_ids
    ids_to_remove = old_tag_ids - new_tag_ids
    transaction do
      ids_to_add.each do |id|
        BandTag.create!(band_id: self.id, tag_id: id)
      end

      ids_to_remove.each do |id|
        BandTag.find_by(band_id: self.id, tag_id: id).destroy
      end
    end
  end
end
