blog_songs = @user.followed_blogs.map(&:songs).flatten
users_songs = @user.followed_users.map(&:favorite_songs).flatten
all_songs = (blog_songs + users_songs).sort_by &:created_at
json.feed_songs do
  json.array!(all_songs) do |feed_song|
    json.partial! "api/songs/list_show", song: feed_song
  end
end
