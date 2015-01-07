class BlogTag < ActiveRecord::Base
  validates :blog_id, :tag_id, presence: true

  belongs_to :blog, inverse_of: :blog_tags
  belongs_to :tag, inverse_of: :blog_tags
end
