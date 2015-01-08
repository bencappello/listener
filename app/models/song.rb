class Song < ActiveRecord::Base
  validates :name, presence: true, uniqueness: {scope: :blog_id}
  validates :blog_id, :band_id, presence: true
  validates :song_type, presence: true, inclusion: { in: ["remix", "regular"] }

  belongs_to :band
  belongs_to :blog
  has_many :song_tags, dependent: :destroy
  has_many :tags, through: :song_tags

  has_many :user_songs, dependent: :destroy
  has_many :favoriters, through: :user_songs, source: :user

  def update_tags(new_tag_ids)
    new_tag_ids.delete("")
    new_tag_ids.map!(&:to_i)
    old_tag_ids = self.tags.pluck(:id)
    ids_to_add = new_tag_ids - old_tag_ids
    ids_to_remove = old_tag_ids - new_tag_ids
    transaction do
      ids_to_add.each do |id|
        SongTag.create!(song_id: self.id, tag_id: id)
      end

      ids_to_remove.each do |id|
        SongTag.find_by(song_id: self.id, tag_id: id).destroy
      end
    end
  end
end
