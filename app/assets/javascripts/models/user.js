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

  addedSongs: function () {
    if(!this._addedSongs) {
      this._addedSongs = new Listener.Collections.Songs();
    }
    return this._addedSongs;
  },

  createdBlogs: function () {
    if(!this._createdBlogs) {
      this._createdBlogs = new Listener.Collections.Blogs();
    }
    return this._createdBlogs;
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
    if(response.songs) {
      this.addedSongs().set(response.songs, { parse: true });
      delete response.songs;
    }
    if(response.blogs) {
      this.createdBlogs().set(response.blogs, { parse: true });
      delete response.blogs;
    }
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

  clear: function(options) {
    var attrs = {};
    this.addedSongs().reset();
    this.createdBlogs().reset();
    this.favoriteSongs().reset();
    this.feedSongs().reset();
    this.followedBlogs().reset();
    this.followedUsers().reset();
    this.followers().reset();
    for (var key in this.attributes) attrs[key] = void 0;
    return this.set(attrs, _.extend({}, options, {unset: true}));
  },

  signOut: function(options){
    var model = this;
    $.ajax({
      url: '/api/session',
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
