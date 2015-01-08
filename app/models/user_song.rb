class UserSong < ActiveRecord::Base
  validates :song_id, presence: true
  validates :user_id, presence: true, :uniqueness => {:scope => :song_id}

  belongs_to :user, inverse_of: :user_songs
  belongs_to :song, inverse_of: :user_songs
end
