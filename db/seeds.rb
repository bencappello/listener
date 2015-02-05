pics = [
  "http://www.mtv.com/crop-images/2013/09/09/slash.jpg",
  "http://static.guim.co.uk/sys-images/Media/Pix/pictures/2010/8/19/1282237124087/Pink-Floyd-006.jpg",
  "http://fc09.deviantart.net/fs11/i/2006/254/2/5/The_Strokes__1__by_alexjames01.png",
  "https://mysterypeople.files.wordpress.com/2013/11/lou-reed-2.jpg",
  "http://www.disc-o-graphy.com/images/65/8d/5d/23/ee/658d5d23e0a8b1558f37427c22f47e27.jpg",
  "http://i.dailymail.co.uk/i/pix/2012/07/25/article-2178781-00558A751000044C-896_306x423.jpg",
  "http://images4.fanpop.com/image/photos/17700000/Rolling-Stones-Wallpaper-classic-rock-17732124-1024-768.jpg",
  "http://rollingout.com/wp-content/uploads/2012/07/Frank+Ocean+01-e1305847591792.jpeg",
  "http://the305.com/blog/wp-content/uploads/2014/05/earl-sweatshirt.jpg",
  "http://www.chartattack.com/wp-content/uploads/2013/01/DEVENDRA-BANHART-32.jpg",
  "http://images.daytrotter.com/concerts/320/21021209-37385753.jpg"
]


me = User.create!(
  username: 'thatpurplestuff',
  email: 'ben@gmail.com',
  password: 'password',
  image_url: "https://i1.sndcdn.com/artworks-000055749355-guzn2f-t500x500.jpg"
  )

25.times do
  User.create!(
    username: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'password',
    image_url: pics.sample
  )
end

tags = Tag.create!([
  {name: 'Funk'},
  {name: 'Indie Rock'},
  {name: 'Folk Rock'},
  {name: 'Electro-pop'},
  {name: 'Soul'},
  {name: 'House'},
  {name: 'Electronic'},
  {name: 'Rap'},
  {name: 'Hip Hop'},
  {name: 'Jazz'},
  {name: 'Folk'},
  {name: 'Metal'},
  {name: 'Punk'},
  {name: 'R&B'},
  {name: 'Disco'},
  {name: 'Country'},
  {name: 'Dub Step'},
  {name: 'Rock'},
  {name: 'Classic Rock'},
  {name: 'Ska'}
])




bands = Band.create!([
  {name: 'Sublime'},
  {name: 'Rolling Stones'},
  {name: 'The Strokes'},
  {name: 'Wilco'},
  {name: 'Chromeo'},
  {name: 'Calvin Harris'},
  {name: 'UGK'},
  {name: 'Miles Davis'},
  {name: 'Queen'},
  {name: 'Pink Floyd'},
  {name: 'Fleet Foxes'},
  {name: 'Beirut'},
  {name: 'Devotchka'},
  {name: 'Frank Ocean'},
  {name: 'Sigur Ros'},
  {name: 'Vampire Weekend'},
  {name: 'Morrissey'},
  {name: 'Sia'},
])

10.times do
  Band.create(name: Faker::App.author)
end

10.times do
  Band.create(name: Faker::Address.city)
end


User.all.each do |user|
  1.times do
    Blog.create(name: Faker::App.name, user_id: user.id)
  end

  1.times do
    Blog.create(name: Faker::Company.name, user_id: user.id)
  end

  1.times do
    Blog.create!(name: Faker::Internet.domain_word, user_id: user.id)
  end
end


songs = Song.create!([
  {name: "Someday", song_type: 'regular', blog_id: User.first.blogs.sample.id, user_id: 1, band_id: 3,
    audio_url: "https://api.soundcloud.com/tracks/122556104/stream?client_id=4346c8125f4f5c40ad666bacd8e96498"},
  {name: "Santeria", song_type: 'regular', blog_id: User.first.blogs.sample.id, user_id: 1, band_id: 1},
  {name: "Satisfaction", song_type: 'regular', blog_id: User.first.blogs.sample.id, user_id: 1, band_id: 2},  
  {name: "You Are My Face", song_type: 'regular', blog_id: User.first.blogs.sample.id, user_id: 1, band_id: 4},
  {name: "Needy Girl", song_type: 'regular', blog_id: User.first.blogs.sample.id, user_id: 1, band_id: 5,
    audio_url: "https://api.soundcloud.com/tracks/34532583/stream?client_id=4346c8125f4f5c40ad666bacd8e96498"},
  {name: "Girls", song_type: 'regular', blog_id: User.first.blogs.sample.id, user_id: 1, band_id: 6},
  {name: "One Day", song_type: 'regular', blog_id: User.first.blogs.sample.id, user_id: 1, band_id: 7},
  {name: "So What", song_type: 'regular', blog_id: User.first.blogs.sample.id, user_id: 1, band_id: 8},
  {name: "Bohemian Rhapsody", song_type: 'regular', blog_id: User.first.blogs.sample.id, user_id: 1, band_id: 9,
    audio_url: "https://api.soundcloud.com/tracks/115417954/stream?client_id=4346c8125f4f5c40ad666bacd8e96498"},
  {name: "Money", song_type: 'regular', blog_id: User.first.blogs.sample.id, user_id: 1, band_id: 10},
  {name: "White Winter Hymnal", song_type: 'regular', blog_id: User.first.blogs.sample.id, user_id: 1, band_id: 11,
    audio_url: "https://api.soundcloud.com/tracks/1366184/stream?client_id=4346c8125f4f5c40ad666bacd8e96498"},
  {name: "Postcards From Italy", song_type: 'regular', blog_id: User.first.blogs.sample.id, user_id: 1, band_id: 12},
  {name: "Charlotte Mittnacht", song_type: 'regular', blog_id: User.first.blogs.sample.id, user_id: 1, band_id: 13},
  {name: "Pink Matter", song_type: 'regular', blog_id: User.first.blogs.sample.id, user_id: 1, band_id: 14},
  {name: "Starálfur", song_type: 'regular', blog_id: User.first.blogs.sample.id, user_id: 1, band_id: 15},
  {name: "Oxford Comma", song_type: 'regular', blog_id: User.first.blogs.sample.id, user_id: 1, band_id: 16,
    audio_url: "https://api.soundcloud.com/tracks/16294193/stream?client_id=4346c8125f4f5c40ad666bacd8e96498"},
  {name: "First of the Gang to Die", song_type: 'regular', blog_id: User.first.blogs.sample.id, user_id: 1, band_id: 17},
  {name: "Chandelier", song_type: 'regular', blog_id: User.first.blogs.sample.id, user_id: 1, band_id: 18},
])




User.all.each do |user|
  10.times do
    type = ['remix', 'regular'].sample
    blog_id = user.blogs.sample.id
    band_id = Band.all.sample.id
    Song.create(name: Faker::App.name, song_type: type, blog_id: blog_id, user_id: user.id, band_id: band_id)

    UserSong.create(user_id: user.id, song_id: Song.all.sample.id)
  end

  5.times do
    UserBlog.create(user_id: user.id, blog_id: Blog.all.sample.id)
  end
end



#Genre Tags

Band.all.each do |band|
  3.times do
    BandTag.create(band: band, tag_id: Tag.all.sample.id)
  end

  7.times do
    Comment.create!(user_id: User.all.sample.id, body: Faker::Hacker.say_something_smart, commentable_id: band.id, commentable_type: 'Band')
  end
end

Blog.all.each do |blog|
  3.times do
    BlogTag.create(blog: blog, tag_id: Tag.all.sample.id)
  end

  7.times do
    Comment.create!(user_id: User.all.sample.id, body: Faker::Hacker.say_something_smart, commentable_id: blog.id, commentable_type: 'Blog')
  end
end

Song.all.each do |song|
  3.times do
    SongTag.create(song: song, tag_id: Tag.all.sample.id)
  end

  7.times do
    Comment.create!(user_id: User.all.sample.id, body: Faker::Hacker.say_something_smart, commentable_id: song.id, commentable_type: 'Song')
  end
end
