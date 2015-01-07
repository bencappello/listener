class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.integer :band_id, null: false
      t.integer :blog_id, null: false
      t.string :name, null: false

      t.timestamps
    end
    add_index :songs, :band_id
    add_index :songs, :blog_id
  end
end
