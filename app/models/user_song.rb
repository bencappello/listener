class UserSong < ActiveRecord::Base
  validates :song_id, :user_id, presence: true

  belongs_to :song, inverse_of: :song_tags
  belongs_to :tag, inverse_of: :song_tags
end
