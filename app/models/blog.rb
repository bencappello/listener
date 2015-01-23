class Blog < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :user_id, presence: true

  belongs_to :user

  has_many :songs
  has_many :blog_tags, dependent: :destroy
  has_many :tags, through: :blog_tags

  has_many :user_blogs, dependent: :destroy
  has_many :followers, through: :user_blogs, source: :user

  has_many :comments, as: :commentable
end
