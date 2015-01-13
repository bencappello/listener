class AddIndexOnUserSongs < ActiveRecord::Migration
  def change
    add_index :user_songs, [:user_id, :song_id], unique: true
  end
end
