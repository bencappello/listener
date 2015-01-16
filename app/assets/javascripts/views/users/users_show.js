Listener.Views.UsersShow = Backbone.CompositeView.extend({

  initialize: function(options){
    this.listenTo(this.model, "sync change", this.render);
    // this.listenTo(Listener.currentUser, 'sync', this.render)
    this.content = options.content;
  },

  template: JST['users/show'],

  events: {
    'click .user-follow': 'toggleFollow',
    'click .btn-favorites': 'renderFavorites',
    'click .btn-feed': 'renderFeed',
    'click .btn-blogs': 'renderBlogs',
  },

  render: function(){
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

  addSong: function (song) {
    var view = new Listener.Views.SongListShow({
      model: song,
      collection: this.model.favoriteSongs(),
    });
    this.addSubview('section.main', view);
  },

  addBlog: function (blog) {
    var view = new Listener.Views.BlogListShow({
      model: blog,
      collection: this.model.followedBlogs(),
    });
    this.addSubview('section.main', view);
  },

  renderFavorites: function () {
    var header = this.model.possessiveName() + ' Favorite Songs';
    this.content = 'favorites';
    this.$el.find('.content-header').html(header)
    this.$el.find('section.main').empty();
    this.model.favoriteSongs().each(this.addSong.bind(this));
  },

  renderFeed: function () {
    var header = this.model.possessiveName() + ' Feed';
    this.content = 'feed';
    this.$el.find('.content-header').html(header)
    this.$el.find('section.main').empty();
    this.model.feedSongs().each(this.addSong.bind(this));
  },

  renderBlogs: function () {
    var header = this.model.possessiveName() + ' Favorite Blogs';
    this.content = 'blogs';
    this.$el.find('.content-header').html(header)
    this.$el.find('section.main').empty();
    this.model.followedBlogs().each(this.addBlog.bind(this));
  },

  toggleFollow: function (event) {
    event.preventDefault();
    var button = $(event.currentTarget)
    var followed_id = button.data('id');
    Listener.currentUser.toggleUserFollow(followed_id);
    button.toggleClass("user-unfollow");
  },
});
