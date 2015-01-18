Listener.Views.UsersShow = Backbone.CompositeView.extend({

  initialize: function(options){
    this.listenTo(this.model, "reloadUser", this.render);
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
    debugger
    var html = this.template({
      user: this.model,
      followed: this.model.followed()
      });
    this.$el.html(html);
    if (this.content == 'blogs') {
      this.renderBlogs();
    } else if (this.content == 'feed') {
      this.renderFeed();
    } else {
      this.renderFavorites();
    }
    return this;
  },

  changeContent: function (event) {
    var targ = $(event.currentTarget);
    var id = targ.attr('id');
    if (id == 'btn-favorites') {
      this.renderFavorites();
    } else if (id == 'btn-feed') {
      this.renderFeed();
    } else {
      this.renderBlogs();
    }
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

  renderBlogs: function () {
    this.content = 'blogs';
    var view = new Listener.Views.UserBlogs({model: this.model});
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
