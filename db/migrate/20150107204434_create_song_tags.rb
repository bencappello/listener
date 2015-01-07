class CreateSongTags < ActiveRecord::Migration
  def change
    create_table :song_tags do |t|
      t.integer :song_id, null: false
      t.integer :tag_id, null: false

      t.timestamps
    end
  end
end
