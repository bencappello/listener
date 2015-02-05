class RemoveUserIdFromBands < ActiveRecord::Migration
  def change
    remove_column :bands, :user_id, :integer
  end
end
