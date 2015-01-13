Listener.Views.UsersShow = Backbone.CompositeView.extend({

  initialize: function(options){
    this.listenTo(this.model, "sync change", this.render);
    this.listenTo(Listener.currentUser, 'sync', this.render)
    this.content = options.content;
  },

  template: JST['users/show'],

  events: {
    'click .follow': 'follow',
    'click .unfollow': 'unfollow',
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
    this.addSubview('section#displayed-content', view);
  },

  renderFavorites: function () {
    this.content = 'favorites';
    this.$el.find('.content-header').html('Favorites')
    this.$el.find('section#displayed-content').empty();
    this.model.favoriteSongs().each(this.addSong.bind(this));
  },

  renderFeed: function () {
    this.content = 'feed';
    this.$el.find('.content-header').html('Feed')
    this.$el.find('section#displayed-content').empty();
    this.model.feedSongs().each(this.addSong.bind(this));
  },

  renderBlogs: function () {

  },

  follow: function () {
    var follow = new Listener.Models.UserFollow({
      followed_user_id: this.model.id
    });
    follow.save(null, {
      success: function () {
        Listener.currentUser.fetch();
      }
    });
  },

  unfollow: function () {
    new Listener.Models.UserFollow({
      id: this.model.id,
    }).destroy({
      success: function () {
        Listener.currentUser.fetch();
      }
    })
  },
});
