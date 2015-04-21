Listener.Views.UsersShow = Backbone.CompositeView.extend({

  initialize: function(options){
    Backbone.GeneralView.prototype.initialize.call(this);
    this.listenTo(this.model, "reloadUser", this.render);
    this.content = options.content;
  },

  template: JST['users/show'],

  events: {
    'click .user-follow': 'toggleFollow',
    'click .user-btn': 'changeContent',
    'click .favorite': 'maybeFetchUser',
    'click .blog-follow': 'maybeFetchUser',
    "click #add-song-link": "createSong",
    "click #add-blog-link": "createBlog",
  },

  render: function(){
    var html = this.template({
      user: this.model,
      followed: this.model.followed()
      });
    this.$el.html(html);
    if (this.content == 'added_blogs') {
      this.renderCreatedBlogs();
    } else if (this.content == 'favorites') {
      this.renderFavorites();
    } else if (this.content == 'added_songs') {
      this.renderAddedSongs();
    } else if (this.content == 'followed_blogs') {
      this.renderFollowedBlogs();
    } else {
      this.renderFeed();
    }
    return this;
  },

  changeContent: function (event) {
    var targ = $(event.currentTarget);
    var id = targ.attr('id');
    if (id == 'btn-created-blogs') {
      this.renderCreatedBlogs();
    } else if (id == 'btn-favorites') {
      this.renderFavorites();
    } else if (id == 'btn-added-songs') {
      this.renderAddedSongs();
    } else if (id == 'btn-feed') {
      this.renderFeed();
    } else {
      this.renderFollowedBlogs();
    }
  },

  renderAddedSongs: function () {
    this.content = 'added_songs';
    this.model.fetch({
      data: {content: 'added_songs'}
    });
    var view = new Listener.Views.AddedSongs({model: this.model});
    this._swapView(view);
  },

  renderCreatedBlogs: function () {
    this.content = 'added_blogs';
    this.model.fetch({
      data: {content: 'added_blogs'}
    });
    var view = new Listener.Views.CreatedBlogs({model: this.model});
    this._swapView(view);
  },

  renderFavorites: function () {
    var that = this;
    this.content = 'favorites';
    this.model.favoriteSongs().fetch({
      data: {user_id: that.model.id, content: 'favorites', page: 1},
      success: function () {
        Listener.audioPlayer.maybeLoadSong(that.model.favoriteSongs().at(0))
      }
    });
    var view = new Listener.Views.UserFavorites({model: this.model});
    this._swapView(view);
  },

  renderFeed: function () {
    var that = this;
    this.content = 'feed';
    this.model.feedSongs().fetch({
      data: {user_id: that.model.id, content: 'feed', page: 1},
      success: function () {
        Listener.audioPlayer.maybeLoadSong(that.model.feedSongs().at(0))
      }
    });
    var view = new Listener.Views.UserFeed({model: this.model});
    this._swapView(view);
  },

  renderFollowedBlogs: function () {
    this.content = 'followed_blogs';
    this.model.fetch({
      data: {content: 'followed_blogs'}
    });
    var view = new Listener.Views.FollowedBlogs({model: this.model});
    this._swapView(view);
  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    $('.main').html(view.render().$el);
  },

  toggleFollow: function (event) {
    if (event) { event.preventDefault(); }
    var callback = this.toggleFollow.bind(this);
    if (!this._requireSignedIn(callback)) { return; }
    Listener.currentUser.toggleUserFollow(this.model.id);
    this.$('.user-follow').toggleClass("user-unfollow");
  },

  createSong: function (event) {
    event.preventDefault();
    var song = new Listener.Models.Song();
    var view = new Listener.Views.SongForm({
      model: song,
    })
    Listener.modalRouter.trigger('swapModal', view)
  },

  createBlog: function (event) {
    event.preventDefault();
    var blog = new Listener.Models.Blog();
    var view = new Listener.Views.BlogForm({
      model: blog,
    })
    Listener.modalRouter.trigger('swapModal', view)
  },

  maybeFetchUser: function () {
    if (this.model.id == Listener.currentUser.id) {
      this.model.fetch();
    }
  },
});
