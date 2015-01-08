class CreateUserUsers < ActiveRecord::Migration
  def change
    create_table :user_users do |t|
      t.integer :follower_id, null: false
      t.integer :followed_user_id, null: false

      t.timestamps
    end
  end
end
