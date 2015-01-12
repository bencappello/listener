# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

me = User.create(
  username: 'thatpurplestuff',
  email: 'ben@gmail.com',
  password: 'password'
)

10.times do
  User.create(
    username: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'password'
  )
end

tags = Tag.create([
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
  {name: 'Classic Rock'},
  {name: 'Ska'}
])

bands = Band.create([
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

songs = Song.create([
  {name: "Santeria", song_type: 'regular', blog_id: 1, band_id: 1},
  {name: "Satisfaction", song_type: 'regular', blog_id: 2, band_id: 2},
  {name: "Reptilia", song_type: 'regular', blog_id: 3, band_id: 3},
  {name: "You Are My Face", song_type: 'regular', blog_id: 4, band_id: 4},
  {name: "Needy Girl", song_type: 'regular', blog_id: 5, band_id: 5},
  {name: "Girls", song_type: 'regular', blog_id: 6, band_id: 6},
  {name: "One Day", song_type: 'regular', blog_id: 7, band_id: 7},
  {name: "So What", song_type: 'regular', blog_id: 8, band_id: 8},
  {name: "Bohemian Rhapsody", song_type: 'regular', blog_id: 9, band_id: 9},
  {name: "Money", song_type: 'regular', blog_id: 10, band_id: 10},
  {name: "Mykonos", song_type: 'regular', blog_id: 11, band_id: 11},
  {name: "Postcards From Italy", song_type: 'regular', blog_id: 12, band_id: 12},
  {name: "Charlotte Mittnacht", song_type: 'regular', blog_id: 13, band_id: 13},
  {name: "Pink Matter", song_type: 'regular', blog_id: 1, band_id: 14},
  {name: "Starálfur", song_type: 'regular', blog_id: 2, band_id: 15},
  {name: "Oxford Comma", song_type: 'regular', blog_id: 3, band_id: 16},
  {name: "First of the Gang to Die", song_type: 'regular', blog_id: 4, band_id: 17},
  {name: "Chandelier", song_type: 'regular', blog_id: 5, band_id: 18},
  ])

blogs = Blog.create([
  {name: 'Chromemusic', url: 'http://www.chromemusic.de'},
  {name: 'The Quietus', url: 'http://thequietus.com/'},
  {name: 'moarrr', url: 'http://moarrr.com'},
  {name: 'Heart And Soul', url: 'http://heartandsoulmusic.tumblr.com/'},
  {name: 'Avant-Avant', url: 'http://avant-avant.net'},
  {name: 'Orange Peel', url: 'http://www.orangepeel.ch/'},
  {name: 'Lady Wood', url: 'http://www.ladywoodmusic.com/'},
  {name: 'Dublab', url: 'http://dublab.com/category/listen/mp3-blog/'},
  {name: 'Lipstick Disco', url: 'http://www.lipstickdisco.co.uk'},
  {name: 'Human Drizzle', url: 'http://humandrizzle.com/'},
  {name: 'Stoney Roads', url: 'http://www.stoneyroads.com/'},
  {name: 'Phonographecorp', url: 'http://www.phonographecorp.fr/'},
  {name: 'Fluid-Radio', url: 'http://fluid-radio.co.uk'},
])
