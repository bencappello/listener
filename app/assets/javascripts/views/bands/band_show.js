Listener.Views.BandShow = Backbone.CommentableView.extend({
  template: JST['bands/show'],

  className: 'band-show',

  events: {
    'click .edit': 'editBand',
  },

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render)
    this.listenTo(this.model.comments(), 'sync', this.renderComments)
  },

  render: function () {
    Backbone.GeneralView.prototype.initialize.call(this);
    this.$el.html(this.template({band: this.model}))
    this.renderSongs();
    this.renderComments();
    this.renderCommentForm('Band');
    if (this.model.songs().length > 0) {
      Listener.audioPlayer.maybeLoadSong(this.model.songs().at(0))
    }

    return this;
  },

  addSong: function (song) {
    var view = new Listener.Views.SongListShow({
      model: song,
      collection: this.model.songs(),
      compressed_template: true
    });
    this.addSubview('#songs', view);
  },

  renderSongs: function () {
    this.$el.find('ul#songs').empty();
    this.model.songs().each(this.addSong.bind(this));
  },

  editBand: function (event) {
    event.preventDefault();
    var band = this.model
    var view = new Listener.Views.BandForm({
      model: band,
      edit: true
    })
    Listener.modalRouter.trigger('swapModal', view)
  },
});
