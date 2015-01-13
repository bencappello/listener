Listener.Views.BlogShow = Backbone.CompositeView.extend({
  template: JST['blogs/show'],

  className: 'blog-show',

  events: {
    'click .follow': 'follow',
    'click .unfollow': 'unfollow',
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
    this.renderCommentForm();
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

  addComment: function (comment) {
    var view = new Listener.Views.CommentShow({
      model: comment,
      collection: this.model.comments(),
      parent: this
    });
    this.addSubview('#comments', view);
  },

  renderComments: function () {
    this.$el.find('ul#comments').empty();
    this.model.comments().each(this.addComment.bind(this));
  },

  renderCommentForm: function () {
    var view = new Listener.Views.CommentForm({
      collection: this.model.comments(),
      parent_id: this.model.id,
      parent_type: 'Blog'
    });
    this.addSubview('#comment-form', view);
  },

  follow: function () {
    var follow = new Listener.Models.BlogFollow({
      blog_id: this.model.id
    });
    follow.save(null, {
      success: function () {
        Listener.currentUser.fetch();
      }
    });
  },

  unfollow: function () {
    new Listener.Models.BlogFollow({
      id: this.model.id,
    }).destroy({
      success: function () {
        Listener.currentUser.fetch();
      }
    })
  },
});
