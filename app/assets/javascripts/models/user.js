Listener.Models.User = Backbone.Model.extend({
  urlRoot: "/api/users",

  username: function(){
    return this.escape("username");
  },

  toJSON: function(){
    var json = { user: _.clone(this.attributes) };
    return json;
  }
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

  favorite_songs: function () {
    if(!this._favorite_songs) {
      this._favorite_songs = new Listener.Collections.Songs();
    }
    return this._favorite_songs;
  },

  followed_blogs: function () {
    if(!this._followed_blogs) {
      this._followed_blogs = new Listener.Collections.Blogs();
    }
    return this._followed_blogs;
  },

  followed_users: function () {
    if(!this._followed_users) {
      this._followed_users = new Listener.Collections.Users();
    }
    return this._followed_users;
  },

  followers: function () {
    if(!this._followers) {
      this._followers = new Listener.Collections.Users();
    }
    return this._followers;
  },

  parse: function (response) {
    if(response.favorite_songs) {
      this.favorite_songs().set(response.favorite_songs, { parse: true });
      delete response.favorite_songs;
    }
    if(response.followed_blogs) {
      this.followed_blogs().set(response.followed_blogs, { parse: true });
      delete response.followed_blogs;
    }
    if(response.followed_users) {
      this.followed_users().set(response.followed_users, { parse: true });
      delete response.followed_users;
    }
    if(response.followers) {
      this.followers().set(response.followers, { parse: true });
      delete response.followers;
    }
    return response;
  },

});
