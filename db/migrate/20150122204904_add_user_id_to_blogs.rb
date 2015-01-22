class AddUserIdToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :user_id, :integer, null: false
  end
end
