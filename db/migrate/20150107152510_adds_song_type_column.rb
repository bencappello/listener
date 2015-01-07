class AddsSongTypeColumn < ActiveRecord::Migration
  def change
    add_column :songs, :song_type, :string, null: false
  end
end
