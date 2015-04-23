album_pics = [
  "https://s3.amazonaws.com/listener-dev/songs/images/missing_song.jpg",
  "http://s3.amazonaws.com/listener-dev/songs/images/000/000/019/list/f251d544.jpg?1423256921",
  "http://s3.amazonaws.com/listener-dev/songs/images/000/000/007/list/artsy_splats_by_Maikey.jpg?1423256895",
  "http://s3.amazonaws.com/listener-dev/songs/images/000/000/016/list/ii-art-artsy-beautiful-Favim.com-689826.jpg?1423256909",
  "http://s3.amazonaws.com/listener-dev/songs/images/000/000/003/list/artsy-accidental-shotsmall.jpg?1423256823",
  "http://s3.amazonaws.com/listener-dev/songs/images/000/000/013/list/Artsy-Apple2.jpg?1423256904",
  "http://s3.amazonaws.com/listener-dev/songs/images/000/000/017/list/Young_Magic_LP_cover_flat.jpg?1423256911",
  "http://s3.amazonaws.com/listener-dev/songs/images/000/000/010/list/photooftheday-iphone-gf-night-summer-newyork-buffalo-tunnel-light-blackandwhite-_mattbissett-Instagram.jpg?1423256900",
  "http://s3.amazonaws.com/listener-dev/songs/images/000/000/021/list/artsy-guitar-by-kaki-king.jpg?1423256924",
  "http://s3.amazonaws.com/listener-dev/songs/images/000/000/008/list/1461857-My-attempt-at-artsy-photography-0.jpg?1423256897",
  "http://s3.amazonaws.com/listener-dev/songs/images/000/000/011/list/welcome-to-artsy-asheville-gray-artus.jpg?1423256901",
  "http://s3.amazonaws.com/listener-dev/songs/images/000/000/001/list/Sunset-from-Artsy-HQ.jpg?1423256819",
  "http://s3.amazonaws.com/listener-dev/songs/images/000/000/015/list/artsy-black-design-background-31000.jpg?1423256907",
  "http://s3.amazonaws.com/listener-dev/songs/images/000/000/006/list/original.jpg?1423256894",
  "http://s3.amazonaws.com/listener-dev/songs/images/000/000/018/list/The_Catalyst_4.75_single_DJ_Crossfire.JPEG?1423256913",
  "http://s3.amazonaws.com/listener-dev/songs/images/000/000/014/list/11-29-13_252520koda_252520chrome_252520forest-AFF8_thumb_25255B2_25255D.jpg?1423256905",
  "http://s3.amazonaws.com/listener-dev/songs/images/000/000/005/list/im-so-artsy-all-of-the-sudden-johnathan-dahl.jpg?1423256892",
  "http://s3.amazonaws.com/listener-dev/songs/images/000/000/002/list/artsy_magenta_trees.jpg?1423256822",
  "http://s3.amazonaws.com/listener-dev/songs/images/000/000/004/list/ARTSY.JPG?1423256824",
  "http://s3.amazonaws.com/listener-dev/songs/images/000/000/020/list/recordseries-pressmarker.jpg?1423256923",
  "http://s3.amazonaws.com/listener-dev/songs/images/000/000/009/list/tumblr_m4v2qcM0fL1ql5w50o1_500.jpg?1423256898",
  "http://s3.amazonaws.com/listener-dev/songs/images/000/000/012/list/artsy-sunflower-sonya-chalmers.jpg?1423256903",
  "http://s3.amazonaws.com/listener-dev/songs/images/000/000/022/list/crystal_20antlers_album_20cover.jpg?1423256925"
]

profile_pics = [
  "http://s3.amazonaws.com/listener-dev/users/images/000/000/002/profile/slash.jpg?1423256793",
  "http://s3.amazonaws.com/listener-dev/users/images/000/000/003/profile/Pink-Floyd-006.jpg?1423256797",
  "http://s3.amazonaws.com/listener-dev/users/images/000/000/004/profile/The_Strokes__1__by_alexjames01.png?1423256798",
  "http://s3.amazonaws.com/listener-dev/users/images/000/000/005/profile/lou-reed-2.jpg?1423256800",
  "http://s3.amazonaws.com/listener-dev/users/images/000/000/007/profile/Rolling-Stones-Wallpaper-classic-rock-17732124-1024-768.jpg?1423256802",
  "http://s3.amazonaws.com/listener-dev/users/images/000/000/008/profile/Frank_Ocean_01-e1305847591792.jpeg?1423256803",
  "http://s3.amazonaws.com/listener-dev/users/images/000/000/009/profile/earl-sweatshirt.jpg?1423256804",
  "http://s3.amazonaws.com/listener-dev/users/images/000/000/010/profile/DEVENDRA-BANHART-32.jpg?1423256808",
  "http://s3.amazonaws.com/listener-dev/users/images/000/000/011/profile/21021209-37385753.jpg?1423256814"
]

markov = MarkyMarkov::TemporaryDictionary.new
markov.parse_file "./app/assets/text/david_copperfield.txt"

def generate_name
  phrase = TokenPhrase.generate(' ').split(' ')
  name = []
  name << phrase[0]
  name << phrase[3]
  name.map(&:capitalize).join(' ')
end



#NEW USERS AND FAVORITES

# users = 5.times do
#   User.create!(
#     username: Faker::Name.name,
#     email: Faker::Internet.email,
#     password: 'password',
#     image_url: profile_pics.sample
#   )
# end
#
# puts users
#
# users.each do |user|
#   40.times do
#     UserSong.create(
#       user_id: user.id,
#       song_id: Song.all.sample.id,
#       created_at: Time.now - rand(72).hour
#     )
#   end
#
#   20.times do
#     UserBlog.create(
#       user_id: user.id,
#       blog_id: Blog.all.sample.id,
#       created_at: Time.now - rand(72).hour
#     )
#   end
# end
















#PRODUCTION SEED

# me = User.create!(
#   username: 'thatpurplestuff',
#   email: 'ben@gmail.com',
#   password: 'password',
#   image_url: "https://i1.sndcdn.com/artworks-000055749355-guzn2f-t500x500.jpg"
#   )
#
# 50.times do
# # profile_pics.each do |pic|
#   user = User.create!(
#     username: Faker::Name.name,
#     email: Faker::Internet.email,
#     password: 'password',
#     # image_url: pic,
#     created_at: Time.now - rand(100).day
#   )
#
#   80.times do
#     UserSong.create(
#       user_id: user.id,
#       song_id: Song.all.sample.id,
#       created_at: Time.now - rand(20).day)
#   end
# end
#
# tags = Tag.create!([
#   {name: 'Funk'},
#   {name: 'Indie Rock'},
#   {name: 'Folk Rock'},
#   {name: 'Electro-pop'},
#   {name: 'Soul'},
#   {name: 'House'},
#   {name: 'Electronic'},
#   {name: 'Rap'},
#   {name: 'Hip Hop'},
#   {name: 'Jazz'},
#   {name: 'Folk'},
#   {name: 'Metal'},
#   {name: 'Punk'},
#   {name: 'R&B'},
#   {name: 'Disco'},
#   {name: 'Country'},
#   {name: 'Dub Step'},
#   {name: 'Rock'},
#   {name: 'Classic Rock'},
#   {name: 'Ska'}
# ])
#
# User.all.each do |user|
#   (rand(2) + 2).times do
#     Blog.create(
#       name: generate_name,
#       user_id: user.id,
#       created_at: Time.now - rand(100).day
#     )
#   end
# end
#
#
# songs = Song.create!([
#   {name: "Someday", song_type: 'regular', blog_id: User.first.blogs.sample.id, user_id: 1, band_name: 'The Strokes',
#     audio_url: "http://s3.amazonaws.com/listener/songs/audios/000/000/001/original/stream?1423248781", created_at: Time.now - rand(100).day,
#     image_url: 'http://upload.wikimedia.org/wikipedia/en/e/e7/The_Strokes_-_Ist_Tis_It_US_cover.png'},
#   {name: "Needy Girl", song_type: 'regular', blog_id: User.first.blogs.sample.id, user_id: 1, band_name: 'Chromeo',
#     audio_url: "https://s3.amazonaws.com/listener-dev/songs/audios/02+Needy+Girl.mp3", created_at: Time.now - rand(100).day,
#     image_url: 'http://youtellconcerts.com/wp-content/uploads/2008/07/chromeomusicbox.jpg'},
#   {name: "Bohemian Rhapsody", song_type: 'regular', blog_id: User.first.blogs.sample.id, user_id: 1, band_name: 'Queen',
#     audio_url: "http://s3.amazonaws.com/listener/songs/audios/000/000/009/original/stream?1423248796", created_at: Time.now - rand(100).day,
#     image_url: 'http://www.queenfanclub.nl/uploads/Bohemian%20Rhapsody.jpg'},
#   {name: "White Winter Hymnal", song_type: 'regular', blog_id: User.first.blogs.sample.id, user_id: 1, band_name: 'Fleet Foxes',
#     audio_url: "http://s3.amazonaws.com/listener/songs/audios/000/000/011/original/stream?1423248801", created_at: Time.now - rand(100).day,
#     image_url: 'http://upload.wikimedia.org/wikipedia/en/0/01/Fleet_foxes.jpg'},
#   {name: "Oxford Comma", song_type: 'regular', blog_id: User.first.blogs.sample.id, user_id: 1, band_name: 'Vampire Weekend',
#     audio_url: "http://s3.amazonaws.com/listener/songs/audios/000/000/016/original/stream?1423248810", created_at: Time.now - rand(100).day,
#     image_url: 'https://38.media.tumblr.com/tumblr_mipeq2gini1s6o2alo1_1361674443_cover.jpg'}
# ])

# @blog_count = 0
# @song_count = 0
# @empty = 0
# @empty_song_count = 0
# User.all.each do |user|
#
#   7.times do
#     UserBlog.create(
#       user_id: user.id,
#       blog_id: Blog.all.sample.id,
#       created_at: Time.now - rand(8).day)
#   end
#
#   ############SONGS##############################
#
  # local_songs = Dir.glob("../songs/*")
  #
  # user.blogs.each do |blog|
  #   @found = false
  #   until @found
  #     audio_file = File.open(local_songs[rand(local_songs.count - 1)])
  #
  #     Mp3Info.open(audio_file) do |mp3|
  #       if mp3.tag.title && mp3.tag.artist
  #         @found = true
  #         puts "title #{mp3.tag.title}"
  #         puts "artist #{mp3.tag.artist}"
  #       end
  #     end
  #   end
  #
  #     Mp3Info.open(audio_file) do |mp3|
  #       title = mp3.tag.title
  #       artist =  mp3.tag.artist
  #       genres = mp3.tag.genre_s
  #
  #       unless mp3.tag2.pictures.empty?
  #         pic_array = mp3.tag2.pictures[0]
  #         picture = File.open(pic_array[0], 'wb'){|f| f.write pic_array[1]}
  #         picture = File.open(pic_array[0])
  #         empty = false
  #       else
  #         puts "EMPTY!!!! #{@empty += 1}"
  #         picture = album_pics.sample
  #         empty = true
  #       end
  #
  #       song = Song.create(
  #         name: title,
  #         band_name: artist,
  #         genres: genres,
  #         song_type: 'regular',
  #         blog_id: blog.id,
  #         user_id: user.id,
  #         image: picture,
  #         audio: audio_file,
  #         created_at: Time.now - rand(100).day
  #       )
  #
  #       puts "BLOG COUNT #{ @blog_count += 1 }"
  #       if song.id
  #         puts "SONG COUNT #{@song_count += 1}"
  #         puts "EMPTY SONG COUNT #{@empty_song_count += 1}" if empty
  #       end
  #
  #       28.times do
  #         UserSong.create(
  #           user_id: User.all.sample.id,
  #           song_id: song.id,
  #           created_at: Time.now - rand(8).day
  #         )
  #       end
  #     end
  # end

  #
  # 12.times do
  #   UserSong.create(
  #     user_id: user.id,
  #     song_id: Song.all.sample.id,
  #     created_at: Time.now - rand(8).day)
  # end
  # ##########################################

# end



#Genre Tags & Comments

Band.all.each do |band|
  if band.comments.count < 4
    2.times do
      Comment.create!(
        user_id: User.all.sample.id,
        body: markov.generate_n_sentences(rand(5) + 1),
        commentable_id: band.id,
        commentable_type: 'Band',
        created_at: Time.now - rand(100).day
      )
    end
  end
end

Blog.all.each do |blog|
  # (rand(3) + 1).times do
  #   BlogTag.create(blog: blog, tag_id: Tag.all.sample.id)
  # end
  if blog.comments.count < 4
    2.times do
      Comment.create!(
        user_id: User.all.sample.id,
        body: markov.generate_n_sentences(rand(5) + 1),
        commentable_id: blog.id,
        commentable_type: 'Blog',
        created_at: Time.now - rand(100).day
      )
    end
  end
end

Song.all.each do |song|
  if song.comments.count < 4
    3.times do
      Comment.create!(
        user_id: User.all.sample.id,
        body: markov.generate_n_sentences(rand(4) + 1),
        commentable_id: song.id,
        commentable_type: 'Song',
        created_at: Time.now - rand(100).day
      )
    end
  end
end



















#DEV SEED

# me = User.create!(
#   username: 'thatpurplestuff',
#   email: 'ben@gmail.com',
#   password: 'password',
#   image_url: "https://i1.sndcdn.com/artworks-000055749355-guzn2f-t500x500.jpg"
#   )
#
# profile_pics.each do |pic|
#   User.create!(
#     username: Faker::Name.name,
#     email: Faker::Internet.email,
#     password: 'password',
#     image_url: pic,
#     created_at: Time.now - rand(100).day
#   )
# end
#
# tags = Tag.create!([
#   {name: 'Funk'},
#   {name: 'Indie Rock'},
#   {name: 'Folk Rock'},
#   {name: 'Electro-pop'},
#   {name: 'Soul'},
#   {name: 'House'},
#   {name: 'Electronic'},
#   {name: 'Rap'},
#   {name: 'Hip Hop'},
#   {name: 'Jazz'},
#   {name: 'Folk'},
#   {name: 'Metal'},
#   {name: 'Punk'},
#   {name: 'R&B'},
#   {name: 'Disco'},
#   {name: 'Country'},
#   {name: 'Dub Step'},
#   {name: 'Rock'},
#   {name: 'Classic Rock'},
#   {name: 'Ska'}
# ])
#
# bands = Band.create!([
#   {name: 'Sublime'},
#   {name: 'Rolling Stones'},
#   {name: 'The Strokes'},
#   {name: 'Wilco'},
#   {name: 'Chromeo'},
#   {name: 'Calvin Harris'},
#   {name: 'UGK'},
#   {name: 'Miles Davis'},
#   {name: 'Queen'},
#   {name: 'Pink Floyd'},
#   {name: 'Fleet Foxes'},
#   {name: 'Beirut'},
#   {name: 'Devotchka'},
#   {name: 'Frank Ocean'},
#   {name: 'Sigur Ros'},
#   {name: 'Vampire Weekend'},
#   {name: 'Morrissey'},
#   {name: 'Sia'},
# ])
#
# 5.times do
#   Band.create(name: generate_name)
# end
#
# User.all.each do |user|
#   (rand(2) + 2).times do
#     Blog.create(
#       name: generate_name,
#       user_id: user.id,
#       created_at: Time.now - rand(100).day
#     )
#   end
# end
#
# local_songs = Dir.glob("../free_songs/*")
# file = File.open(local_songs[rand(local_songs.count - 1)])
#
# User.all.each do |user|
#   1.times do
#     type = ['remix', 'regular'].sample
#     blog_id = user.blogs.sample.id
#     band_id = Band.all.sample.id
#     audio_file = File.open(local_songs[rand(local_songs.count - 1)])
#
#     Mp3Info.open(audio_file) do |mp3|
#       title = mp3.tag.title
#       artist =  mp3.tag.artist
#       picture = m.tag2.pictures[0]
#       Song.create(
#         name: title,
#         band_name: artist,
#         song_type: 'regular',
#         blog_id: blog_id,
#         user_id: user.id,
#         image_url: album_pics.sample,
#         audio: audio_file,
#         created_at: Time.now - rand(100).day
#       )
#     end
#   end
#
#   8.times do
#     UserSong.create(
#       user_id: user.id,
#       song_id: Song.all.sample.id,
#       created_at: Time.now - rand(8).day)
#   end
#
#   7.times do
#     UserBlog.create(
#       user_id: user.id,
#       blog_id: Blog.all.sample.id,
#       created_at: Time.now - rand(8).day)
#   end
# end
#
#
#
#
#
#
# #Genre Tags
#
# Blog.all.each do |blog|
#   (rand(4) + 2).times do
#     BlogTag.create(blog: blog, tag_id: Tag.all.sample.id)
#   end
# end
#
# Song.all.each do |song|
#   (rand(3) + 1).times do
#     SongTag.create(song: song, tag_id: Tag.all.sample.id)
#   end
# end
