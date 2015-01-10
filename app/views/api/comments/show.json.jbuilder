json.extract! @comment, :id, :body, :user_id, :created_at, :updated_at

json.author_name @comment.author.username
