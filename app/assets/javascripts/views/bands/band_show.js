Listener.Views.BandShow = Backbone.CommentableView.extend({
  template: JST['bands/show'],

  className: 'band-show',

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render)
    this.listenTo(this.model.comments(), 'sync', this.renderComments)
  },

  render: function () {
    this.$el.html(this.template({band: this.model}))
    this.renderSongs();
    this.renderComments();
    this.renderCommentForm('Band');
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
});
