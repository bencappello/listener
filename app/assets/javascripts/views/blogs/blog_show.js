Listener.Views.BlogShow = Backbone.CommentableView.extend({
  template: JST['blogs/show'],

  className: 'blog-show',

  events: {
    'click .blog-follow': 'toggleFollow',
    "click #add-song-link": "createSong",
  },

  initialize: function () {
    Backbone.GeneralView.prototype.initialize.call(this);
    this.listenTo(this.model, 'sync', this.render)
    this.listenTo(this.model.comments(), 'sync', this.renderComments)
    // this.listenTo(Listener.currentUser, 'sync', this.render)
  },

  render: function () {
    this.$el.html(this.template({blog: this.model}))
    this.renderSongs();
    this.renderComments();
    this.renderCommentForm('Blog');
    return this;
  },

  addSong: function (song) {
    var view = new Listener.Views.SongListShow({
      model: song,
      collection: this.model.songs(),
    });
    this.addSubview('#songs', view);
  },

  renderSongs: function () {
    this.$el.find('ul#songs').empty();
    this.model.songs().each(this.addSong.bind(this));
  },

  toggleFollow: function (event) {
    if (event) { event.preventDefault(); }
    var callback = this.toggleFollow.bind(this);
    if (!this._requireSignedIn(callback)) { return; }
    Listener.currentUser.toggleBlogFollow(this.model.id);
    this.$('.blog-follow').toggleClass("blog-unfollow");
  },

  createSong: function (event) {
    event.preventDefault();
    var song = new Listener.Models.Song();
    var view = new Listener.Views.SongForm({
      model: song,
      collection: this.model.songs(),
      currentBlogId: this.model.id
    })
    Listener.modalRouter.trigger('swapModal', view)
  },
});
