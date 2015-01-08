class UserBlog < ActiveRecord::Base
  validates :blog_id, presence: true
  validates :user_id, presence: true, :uniqueness => {:scope => :blog_id}

  belongs_to :user, inverse_of: :user_blogs
  belongs_to :blog, inverse_of: :user_blogs
end
