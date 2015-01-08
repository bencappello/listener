class Blog < ActiveRecord::Base
  validates :name, :url, presence: true, uniqueness: true

  has_many :songs
  has_many :blog_tags, dependent: :destroy
  has_many :tags, through: :blog_tags

  has_many :user_blogs, dependent: :destroy
  has_many :followers, through: :user_blogs, source: :user

  def update_tags(new_tag_ids)
    new_tag_ids.delete("")
    new_tag_ids.map!(&:to_i)
    old_tag_ids = self.tags.pluck(:id)
    ids_to_add = new_tag_ids - old_tag_ids
    ids_to_remove = old_tag_ids - new_tag_ids
    transaction do
      ids_to_add.each do |id|
        BlogTag.create!(blog_id: self.id, tag_id: id)
      end

      ids_to_remove.each do |id|
        BlogTag.find_by(blog_id: self.id, tag_id: id).destroy
      end
    end
  end

end
