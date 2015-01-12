Listener.Routers.SongsRouter = Backbone.Router.extend ({
  initialize: function () {
    this.$rootEl = $('#content')
    this.songs = new Listener.Collections.Songs();
  },

  routes: {
    // '': 'songsIndex',
    'songs': 'songsIndex',
    'songs/new': 'songNew',
    'songs/:id': 'songShow',
    'bands/:id/edit': 'bandEdit',
  },

  songsIndex: function () {
    this.songs.fetch();
    var view = new Listener.Views.SongsIndex({collection: this.songs});
    this._swapView(view);
  },

  songShow: function (id) {
    var song = this.songs.getOrFetch(id)
    var view = new Listener.Views.SongShow({model: song});
    this._swapView(view);
  },

  songNew: function () {
    var song = new Listner.Models.Song();
    var view = new Listener.Views.SongForm({model: song, collection: this.bands})
    this._swapView(view);
  },

  bandEdit: function (id) {
    var band = this.bands.getOrFetch(id);
    var view = new Listener.Views.BandForm({model: band, collection: this.bands})
    this._swapView(view);
  },

  _swapView: function (view) {
    this.currentView && this.currentView.remove();
    this.currentView = view;
    this.$rootEl.html(view.render().$el);
  },
});
