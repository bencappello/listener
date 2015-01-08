class UserFollow < ActiveRecord::Base
  validates :follower_id, presence: true
  validates :followed_user_id, presence: true, :uniqueness => {:scope => :follower_id}

  belongs_to(
    :follower,
    class_name: "User",
    inverse_of: :user_follows
  )

  belongs_to(
  :followed_user,
  class_name: "User",
  inverse_of: :user_follows
  )

end
