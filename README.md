== README ==

This is a clone of the website Hype Machine. Hypemachine is a music blog aggregator that scrapes music blogs for embedded music content and saves the links to its database. Users can play the songs with the site's music player. Users can search for songs with a search bar or can go to a particular blog's show page.  A user can 'love' songs which then show up on his loved songs page. A user can also follow a blog or another user. A user has a personal feed which consists of a list of the songs published by the blogs he follows and songs loved by other users he follows.

Rails side:

user auth
songs table with blog id foreign key
initially I will seed the DB with songs and later add the scraper functionality to actually scrape blogs to add songs in to the DB
blogs table
user/song join table (loved songs)
user/blog join table (followed blogs)
user/user join table (followed users)

Backbone side:

Nav bar
search bar
the site's music player
(I still do not know how I will make the site's music player. I need to look into this to figure out what technology I can use to make this)
link to "popular songs" page
popular songs are the most recent additions to the user/song join table (last 50 for instance)
User loved songs page
has a button to follow the user unless it is the currently signed-in user's age
User feed page
What is listed for every song:
song title
artist
blog that posted the song
button to 'love' the song
button to play the song

Later goals:
next to song list item in any page show how many users have loved that song.
that number should actually be a button which loads a page listing all the users that have loved the song.
each user list item is a link to that user's loved songs page.
add the scraper functionality to update the songs in the database with the content found on a set of identified blogs.
