class CreateUserSongs < ActiveRecord::Migration
  def change
    create_table :user_songs do |t|
      t.integer :user_id, null: false
      t.integer :song_id, null: false

      t.timestamps
    end
  end
end
