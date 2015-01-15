Listener.Models.User = Backbone.Model.extend({
  urlRoot: "/api/users",

  toJSON: function(){
    var json = { user: _.clone(this.attributes) };

    if (this._image) {
      json.user.image = this._image;
    }
    return json;
  },

  username: function () {
    return this.escape("username");
  },

  possessiveName: function () {
    if (Listener.currentUser.id == this.id) {
      return 'My'
    } else {
      return this.escape('username') + "'s"
    }
  },

  favoriteSongs: function () {
    if(!this._favoriteSongs) {
      this._favoriteSongs = new Listener.Collections.Songs();
    }
    return this._favoriteSongs;
  },

  feedSongs: function () {
    if(!this._feedSongs) {
      this._feedSongs = new Listener.Collections.Songs();
    }
    return this._feedSongs;
  },

  followedBlogs: function () {
    if(!this._followedBlogs) {
      this._followedBlogs = new Listener.Collections.Blogs();
    }
    return this._followedBlogs;
  },

  followedUsers: function () {
    if(!this._followedUsers) {
      this._followedUsers = new Listener.Collections.Users();
    }
    return this._followedUsers;
  },

  followers: function () {
    if(!this._followers) {
      this._followers = new Listener.Collections.Users();
    }
    return this._followers;
  },

  parse: function (response) {
    if(response.favorite_songs) {
      this.favoriteSongs().set(response.favorite_songs, { parse: true });
      delete response.favorite_songs;
    }
    if(response.feed_songs) {
      this.feedSongs().set(response.feed_songs, { parse: true });
      delete response.feed_songs;
    }
    if(response.followed_blogs) {
      this.followedBlogs().set(response.followed_blogs, { parse: true });
      delete response.followed_blogs;
    }
    if(response.followed_users) {
      this.followedUsers().set(response.followed_users, { parse: true });
      delete response.followed_users;
    }
    if(response.followers) {
      this.followers().set(response.followers, { parse: true });
      delete response.followers;
    }
    return response;
  },

  followed: function () {
    var followed_user_ids = Listener.currentUser.followedUsers().pluck('id');
    if (_.contains(followed_user_ids, this.id)) {
      return true;
    } else {
      return false;
    }
  },
});

Listener.Models.CurrentUser = Listener.Models.User.extend({

  url: "/api/session",

  initialize: function(options){
    this.listenTo(this, "change", this.fireSessionEvent);
  },

  isSignedIn: function() {
    return !this.isNew();
  },

  signIn: function(options){
    var model = this;
    var credentials = {
      "user[email]": options.email,
      "user[password]": options.password
    };

    $.ajax({
      url: this.url,
      type: "POST",
      data: credentials,
      dataType: "json",
      success: function(data){
        model.set(data);
        options.success && options.success();
      },
      error: function(){
        options.error && options.error();
      }
    });
  },

  signOut: function(options){
    var model = this;

    $.ajax({
      url: this.url,
      type: "DELETE",
      dataType: "json",
      success: function(data){
        model.clear();
        options.success && options.success();
      }
    });
  },

  fireSessionEvent: function(){
    if(this.isSignedIn()){
      this.trigger("signIn");
      console.log("currentUser is signed in!", this);
    } else {
      this.trigger("signOut");
      console.log("currentUser is signed out!", this);
    }
  },

  toggleBlogFollow: function (blog_id) {
    var that = this;
    var response;
    $.ajax({
      url: "/api/user_blogs",
      type: "POST",
      data: {
        blog_id: blog_id,
      }, success: function (resp) {
        that.fetch();
      }
    });
  },

  toggleFavorite: function (song_id) {
    var that = this;
    var response;
    $.ajax({
      url: "/api/user_songs",
      type: "POST",
      data: {
        song_id: song_id,
      }, success: function (resp) {
        that.fetch();
      }
    });
  },

  toggleUserFollow: function (followed_id) {
    var that = this;
    var response;
    $.ajax({
      url: "/api/user_follows",
      type: "POST",
      data: {
        followed_id: followed_id,
      }, success: function (resp) {
        that.fetch();
      }
    });
  },

});
