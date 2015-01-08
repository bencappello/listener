class SongTag < ActiveRecord::Base
  validates :song, presence: true
  validates :tag_id, presence: true, :uniqueness => {:scope => :song_id}

  belongs_to :song, inverse_of: :song_tags
  belongs_to :tag, inverse_of: :song_tags
end
