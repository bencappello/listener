profile_pics = [
  "http://www.mtv.com/crop-images/2013/09/09/slash.jpg",
  "http://static.guim.co.uk/sys-images/Media/Pix/pictures/2010/8/19/1282237124087/Pink-Floyd-006.jpg",
  "http://fc09.deviantart.net/fs11/i/2006/254/2/5/The_Strokes__1__by_alexjames01.png",
  "https://mysterypeople.files.wordpress.com/2013/11/lou-reed-2.jpg",
  "http://i.dailymail.co.uk/i/pix/2012/07/25/article-2178781-00558A751000044C-896_306x423.jpg",
  "http://images4.fanpop.com/image/photos/17700000/Rolling-Stones-Wallpaper-classic-rock-17732124-1024-768.jpg",
  "http://rollingout.com/wp-content/uploads/2012/07/Frank+Ocean+01-e1305847591792.jpeg",
  "http://the305.com/blog/wp-content/uploads/2014/05/earl-sweatshirt.jpg",
  "http://www.chartattack.com/wp-content/uploads/2013/01/DEVENDRA-BANHART-32.jpg",
  "http://images.daytrotter.com/concerts/320/21021209-37385753.jpg"
]

album_pics = [
  'http://mystartupiscoolerthanyours.com/wp-content/uploads/2014/05/Sunset-from-Artsy-HQ.jpg',
  'http://www.zingerbugimages.com/backgrounds/artsy_magenta_trees.jpg',
  'http://bristolwood.net/wp-content/uploads/2009/02/artsy-accidental-shotsmall.jpg',
  'http://cas.umkc.edu/physics/sps/projects/pinhole/ARTSY.JPG',
  'http://images.fineartamerica.com/images-medium/im-so-artsy-all-of-the-sudden-johnathan-dahl.jpg',
  'http://data3.whicdn.com/images/64182946/original.jpg',
  'http://fc03.deviantart.net/fs17/f/2007/149/9/b/artsy_splats_by_Maikey.jpg',
  'https://photos.travelblog.org/Photos/1294/195485/f/1461857-My-attempt-at-artsy-photography-0.jpg',
  'http://25.media.tumblr.com/tumblr_m4v2qcM0fL1ql5w50o1_500.jpg',
  'http://cloud.lomography.com/576/581/ea/2cd7125a76c38623bec119ce97ddd21072cfe9.jpg',
  'http://wac.450f.edgecastcdn.net/80450F/929jackfm.com/files/2012/08/photooftheday-iphone-gf-night-summer-newyork-buffalo-tunnel-light-blackandwhite-@mattbissett-Instagram.jpg',
  'http://images.fineartamerica.com/images-medium-large/welcome-to-artsy-asheville-gray-artus.jpg',
  'http://images.fineartamerica.com/images-medium/artsy-sunflower-sonya-chalmers.jpg',
  'http://www.archerville.com/sue/stilllife/1207/Artsy-Apple2.jpg',
  'http://lh4.ggpht.com/-8d-Sk1YQR7M/UmgxK4HwLKI/AAAAAAAAegI/yFRRVD0OExg/11-29-13%252520koda%252520chrome%252520forest-AFF8_thumb%25255B2%25255D.jpg?imgmax=800',
  'http://images2.layoutsparks.com/1/130352/artsy-black-design-background-31000.jpg',
  'http://s8.favim.com/orig/72/ii-art-artsy-beautiful-Favim.com-689826.jpg',
  'http://media.creativebloq.futurecdn.net/sites/creativebloq.com/files/articles/article/2012/06/Young_Magic_LP_cover_flat.jpg',
  'http://1.bp.blogspot.com/_pdM8IBQO_cQ/TL3-famA0eI/AAAAAAAAAAU/fbAm97gHZWg/s1600/The+Catalyst+4.75+single+DJ+Crossfire.JPEG',
  'http://www.weallwantsomeone.org/wp-content/uploads/2012/03/f251d544.jpg',
  'http://img.photobucket.com/albums/v27/deekneez/recordseries-pressmarker.jpg',
  'http://www.autostraddle.com/wp-content/uploads/2009/08/artsy-guitar-by-kaki-king.jpg',
  'http://wac.450f.edgecastcdn.net/80450F/diffuser.fm/files/2012/05/crystal_20antlers_album_20cover.jpg'
]


me = User.create!(
  username: 'thatpurplestuff',
  email: 'ben@gmail.com',
  password: 'password',
  image_url: "https://i1.sndcdn.com/artworks-000055749355-guzn2f-t500x500.jpg"
  )

5.times do
  User.create!(
    username: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'password',
    image_url: profile_pics.sample,
    created_at: Time.now - rand(100).day
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
    Blog.create(name: Faker::App.name, user_id: user.id, created_at: Time.now - rand(100).day)
  end

  1.times do
    Blog.create(name: Faker::Company.name, user_id: user.id, created_at: Time.now - rand(100).day)
  end

  1.times do
    Blog.create!(name: Faker::Internet.domain_word, user_id: user.id, created_at: Time.now - rand(100).day)
  end
end


songs = Song.create!([
  {name: "Someday", song_type: 'regular', blog_id: User.first.blogs.sample.id, user_id: 1, band_id: 3,
    audio_url: "https://api.soundcloud.com/tracks/122556104/stream?client_id=4346c8125f4f5c40ad666bacd8e96498", created_at: Time.now - rand(100).day,
    image_url: 'http://upload.wikimedia.org/wikipedia/en/e/e7/The_Strokes_-_Ist_Tis_It_US_cover.png'},
  {name: "Santeria", song_type: 'regular', blog_id: User.first.blogs.sample.id, user_id: 1, band_id: 1, created_at: Time.now - rand(100).day,
    image_url: 'http://upload.wikimedia.org/wikipedia/en/9/94/Sublime_Self-Titled.jpg'},
  {name: "Satisfaction", song_type: 'regular', blog_id: User.first.blogs.sample.id, user_id: 1, band_id: 2, created_at: Time.now - rand(100).day,
    image_url: 'http://upload.wikimedia.org/wikipedia/en/7/7f/Satisfaction-us.jpg'},
  {name: "You Are My Face", song_type: 'regular', blog_id: User.first.blogs.sample.id, user_id: 1, band_id: 4, created_at: Time.now - rand(100).day,
    image_url: 'http://a3.img.mobypicture.com/376af02f9281ddc43d2f9326600ccff9_view.jpg'},
  {name: "Needy Girl", song_type: 'regular', blog_id: User.first.blogs.sample.id, user_id: 1, band_id: 5,
    audio_url: "https://api.soundcloud.com/tracks/34532583/stream?client_id=4346c8125f4f5c40ad666bacd8e96498", created_at: Time.now - rand(100).day,
    image_url: 'http://youtellconcerts.com/wp-content/uploads/2008/07/chromeomusicbox.jpg'},
  {name: "Girls", song_type: 'regular', blog_id: User.first.blogs.sample.id, user_id: 1, band_id: 6, created_at: Time.now - rand(100).day,
    image_url: 'http://upload.wikimedia.org/wikipedia/en/5/55/Girls-album.jpg'},
  {name: "One Day", song_type: 'regular', blog_id: User.first.blogs.sample.id, user_id: 1, band_id: 7, created_at: Time.now - rand(100).day,
    image_url: 'http://cps-static.rovicorp.com/3/JPG_400/MI0000/107/MI0000107533.jpg?partner=allrovi.com'},
  {name: "So What", song_type: 'regular', blog_id: User.first.blogs.sample.id, user_id: 1, band_id: 8, created_at: Time.now - rand(100).day,
    image_url: 'http://ecx.images-amazon.com/images/I/61L2pef6hzL._SL500_AA280_.jpg'},
  {name: "Bohemian Rhapsody", song_type: 'regular', blog_id: User.first.blogs.sample.id, user_id: 1, band_id: 9,
    audio_url: "https://api.soundcloud.com/tracks/115417954/stream?client_id=4346c8125f4f5c40ad666bacd8e96498", created_at: Time.now - rand(100).day,
    image_url: 'http://www.queenfanclub.nl/uploads/Bohemian%20Rhapsody.jpg'},
  {name: "Money", song_type: 'regular', blog_id: User.first.blogs.sample.id, user_id: 1, band_id: 10, created_at: Time.now - rand(100).day,
    image_url: 'http://upload.wikimedia.org/wikipedia/en/3/3b/Dark_Side_of_the_Moon.png'},
  {name: "White Winter Hymnal", song_type: 'regular', blog_id: User.first.blogs.sample.id, user_id: 1, band_id: 11,
    audio_url: "https://api.soundcloud.com/tracks/1366184/stream?client_id=4346c8125f4f5c40ad666bacd8e96498", created_at: Time.now - rand(100).day,
    image_url: 'http://upload.wikimedia.org/wikipedia/en/0/01/Fleet_foxes.jpg'},
  {name: "Postcards From Italy", song_type: 'regular', blog_id: User.first.blogs.sample.id, user_id: 1, band_id: 12, created_at: Time.now - rand(100).day,
    image_url: 'http://ecx.images-amazon.com/images/I/51CHIgaEHjL._SS280.jpg'},
  {name: "Charlotte Mittnacht", song_type: 'regular', blog_id: User.first.blogs.sample.id, user_id: 1, band_id: 13, created_at: Time.now - rand(100).day,
    image_url: 'http://i.ytimg.com/vi/RD9ZMDGJcQc/hqdefault.jpg'},
  {name: "Pink Matter", song_type: 'regular', blog_id: User.first.blogs.sample.id, user_id: 1, band_id: 14, created_at: Time.now - rand(100).day,
    image_url: 'http://d3aunljtr1h7e8.cloudfront.net/frankocean/images/artwork/booklet_01.jpg'},
  {name: "Starálfur", song_type: 'regular', blog_id: User.first.blogs.sample.id, user_id: 1, band_id: 15, created_at: Time.now - rand(100).day,
    image_url: 'http://ecx.images-amazon.com/images/I/51sDqoy0yxL._SS280.jpg'},
  {name: "Oxford Comma", song_type: 'regular', blog_id: User.first.blogs.sample.id, user_id: 1, band_id: 16,
    audio_url: "https://api.soundcloud.com/tracks/16294193/stream?client_id=4346c8125f4f5c40ad666bacd8e96498", created_at: Time.now - rand(100).day,
    image_url: 'https://38.media.tumblr.com/tumblr_mipeq2gini1s6o2alo1_1361674443_cover.jpg'},
  {name: "First of the Gang to Die", song_type: 'regular', blog_id: User.first.blogs.sample.id, user_id: 1, band_id: 17, created_at: Time.now - rand(100).day,
    image_url: 'http://upload.wikimedia.org/wikipedia/en/thumb/f/f3/MorrisseyFirstGang.jpg/220px-MorrisseyFirstGang.jpg'},
  {name: "Chandelier", song_type: 'regular', blog_id: User.first.blogs.sample.id, user_id: 1, band_id: 18, created_at: Time.now - rand(100).day,
    image_url: 'http://buzzworthy.mtv.com//wp-content/uploads/buzz/2014/03/sia-chandelier-cover-art.jpg'},
])


User.all.each do |user|
  2.times do
    type = ['remix', 'regular'].sample
    blog_id = user.blogs.sample.id
    band_id = Band.all.sample.id
    Song.create(
      name: Faker::App.name,
      song_type: type,
      blog_id: blog_id,
      user_id: user.id,
      band_id: band_id,
      image_url: album_pics.sample,
      created_at: Time.now - rand(100).day
    )
  end

  10.times do
    UserSong.create(
      user_id: user.id,
      song_id: Song.all.sample.id,
      created_at: Time.now - rand(8).day)
  end

  5.times do
    UserBlog.create(
      user_id: user.id,
      blog_id: Blog.all.sample.id,
      created_at: Time.now - rand(8).day)
  end
end



#Genre Tags

Band.all.each do |band|
  7.times do
    Comment.create!(
      user_id: User.all.sample.id,
      body: Faker::Hacker.say_something_smart,
      commentable_id: band.id,
      commentable_type: 'Band',
      created_at: Time.now - rand(100).day
    )
  end
end

Blog.all.each do |blog|
  3.times do
    BlogTag.create(blog: blog, tag_id: Tag.all.sample.id)
  end

  7.times do
    Comment.create!(
      user_id: User.all.sample.id,
      body: Faker::Hacker.say_something_smart,
      commentable_id: blog.id,
      commentable_type: 'Blog',
      created_at: Time.now - rand(100).day
    )
  end
end

Song.all.each do |song|
  3.times do
    SongTag.create(song: song, tag_id: Tag.all.sample.id)
  end

  7.times do
    Comment.create!(
      user_id: User.all.sample.id,
      body: Faker::Hacker.say_something_smart,
      commentable_id: song.id,
      commentable_type: 'Song',
      created_at: Time.now - rand(100).day
    )
  end
end
