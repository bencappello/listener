class BlogTag < ActiveRecord::Base
  validates :blog, presence: true
  validates :tag_id, presence: true, :uniqueness => {:scope => :blog_id}

  belongs_to :blog, inverse_of: :blog_tags
  belongs_to :tag, inverse_of: :blog_tags
end
