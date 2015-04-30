#Listener

###Description
Inspired by sites such as Soundcloud and Hype Machine, Listener is a music sharing ecosystem where users can create music blogs, add songs, and discover music in a variety of ways.

###Features
* Single page Backbone.js Application.
* Consumes a Rails JSON API.
* Custom built user authentication uses BCrypt for encrypting passwords.
* Extends Backbone.View with a custom compositeView class to create nested Backbone views.
* Polymorphic comments model allows comments to be placed on songs, blogs and bands.
* Music player attached in sticky nav bar (separate backbone view) allowing continuous playing during site navigation.
* Stores image and audio files on Amazon S3. Uses Paperclip for uploads to S3.
* Uses Kaminari pagination for an infinite scroll on pages that list songs. This improves the user experience by reducing load time and providing an aesthetically pleasing interface to load songs.
* Uses pg_search for custom song search database queries.
* Employs basic site tour using Joyride jQuery plug-in



###Goals
* Add functionality to display all users who have favorited a song and followed a blog or a user.
* Add scraper functionality to pull in songs from music blogs hosted outside Listener.
