Listener.Views.SongShow = Backbone.View.extend ({
  template: JST['songs/show'],

  className: 'song-show',

  initialize: function (options) {
    this.listenTo(this.model, 'sync', this.render)
  },

  render: function () {
    this.$el.html(this.template({song: this.model}))
    return this;
  },
});
