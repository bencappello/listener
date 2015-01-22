class AddUserIdToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :user_id, :integer, null: false
  end
end
