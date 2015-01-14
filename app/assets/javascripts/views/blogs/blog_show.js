Listener.Views.BlogShow = Backbone.CompositeView.extend({
  template: JST['blogs/show'],

  className: 'blog-show',

  events: {
    'click .blog-follow': 'toggleFollow',
  },

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render)
    this.listenTo(this.model.comments(), 'sync', this.renderComments)
    this.listenTo(Listener.currentUser, 'sync', this.render)
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
    event.preventDefault();
    var button = $(event.currentTarget)
    var blog_id = button.data('id');
    var followed = Listener.currentUser.toggleBlogFollow(blog_id);
    button.toggleClass("blog-unfollow");
  },
});
