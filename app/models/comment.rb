class Comment < ActiveRecord::Base
  validates :user_id, :body, :commentable_id, :commentable_type, presence: true

  belongs_to(
    :author,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id
  )

  belongs_to :commentable, polymorphic: true
end
