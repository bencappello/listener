Listener.Views.SongSearch = Backbone.CompositeView.extend({
  template: JST['songs/search'],

  className: 'songs-search',

  initialize: function (options) {
    this.query = options.query
    this.listenTo(this.collection, 'sync', this.render)
  },

  render: function () {
    this.$el.html(this.template({songs: this.collection, query: this.query}))
    this.renderSongs();
    return this;
  },

  addSong: function (song) {
    var view = new Listener.Views.SongListShow({
      model: song,
      collection: this.collection,
    });
    this.addSubview('#songs', view);
  },

  renderSongs: function () {
    this.$el.find('ul#songs').empty();
    this.collection.each(this.addSong.bind(this));
  },
});
