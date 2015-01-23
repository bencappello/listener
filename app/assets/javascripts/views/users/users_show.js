Listener.Views.UsersShow = Backbone.CompositeView.extend({

  initialize: function(options){
    this.listenTo(this.model, "reloadUser", this.render);
    Backbone.GeneralView.prototype.initialize.call(this);
    this.content = options.content;
  },

  template: JST['users/show'],

  events: {
    'click .user-follow': 'toggleFollow',
    'click .user-btn': 'changeContent',
    'click .favorite': 'maybeFetchUser',
    'click .blog-follow': 'maybeFetchUser',
  },

  render: function(){
    var html = this.template({
      user: this.model,
      followed: this.model.followed()
      });
    this.$el.html(html);
    if (this.content == 'created_blogs') {
      this.renderCreatedBlogs();
    } else if (this.content == 'feed') {
      this.renderFeed();
    } else if (this.content == 'followed_blogs') {
      this.renderFollowedBlogs();
    } else {
      this.renderFavorites();
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
    } else if (id == 'btn-feed') {
      this.renderFeed();
    } else {
      this.renderFollowedBlogs();
    }
  },

  renderCreatedBlogs: function () {
    this.content = 'created_blogs';
    var view = new Listener.Views.CreatedBlogs({model: this.model});
    this._swapView(view);
  },

  renderFavorites: function () {
    this.content = 'favorites';
    var view = new Listener.Views.UserFavorites({model: this.model});
    this._swapView(view);
  },

  renderFeed: function () {
    this.content = 'feed';
    var view = new Listener.Views.UserFeed({model: this.model});
    this._swapView(view);
  },

  renderFollowedBlogs: function () {
    this.content = 'followed_blogs';
    var view = new Listener.Views.FollowedBlogs({model: this.model});
    this._swapView(view);
  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    $('.main').html(view.render().$el);
  },

  toggleFollow: function (event) {
    event.preventDefault();
    var button = $(event.currentTarget)
    var followed_id = button.data('id');
    Listener.currentUser.toggleUserFollow(followed_id);
    button.toggleClass("user-unfollow");
  },

  maybeFetchUser: function () {
    if (this.model.id == Listener.currentUser.id) {
      this.model.fetch();
    }
  },
});
