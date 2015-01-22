class RemoveUrlFromBlogs < ActiveRecord::Migration
  def change
    remove_column :blogs, :url, :string
  end
end
