Listener.Routers.SongsRouter = Backbone.Router.extend ({
  initialize: function () {
    this.$rootEl = $('#content');
    this.songs = new Listener.Collections.Songs();
  },

  routes: {
    '': 'find',
    'songs': 'songsIndex',
    'songs/:id': 'songShow',
    'songs/:id/edit': 'songEdit',
    'songs/search/:query': 'search',
    'songs/find/:suffix': 'find',
  },

  songsIndex: function () {
    this.songs.fetch();
    var view = new Listener.Views.SongsIndex({collection: this.songs});
    this._swapView(view);
  },

  songShow: function (id) {
    Listener.currentUser.fetch();
    var song = this.songs.getOrFetch(id)
    var view = new Listener.Views.SongShow({model: song});
    this._swapView(view);
  },

  songNew: function () {
    var song = new Listener.Models.Song();
    var view = new Listener.Views.SongForm({model: song, collection: this.songs})
    this._swapView(view);
  },

  songEdit: function (id) {
    var song = this.songs.getOrFetch(id);
    var view = new Listener.Views.SongForm({model: song, collection: this.songs})
    this._swapView(view);
  },

  search: function (query, page) {
    page = page || 1
    var results = new Listener.Collections.Songs();
    results.fetch ({
      data: {query: query, page: page}
    })
    var view = new Listener.Views.SongsSearch({collection: results, query: query})
    this._swapView(view);
  },

  find: function (suffix, page) {
    page = page || 1
    suffix = suffix || 'popular_now'
    var songs = new Listener.Collections.Songs();
    songs.fetch ({
      data: {find: suffix, page: page}
    })
    var view = new Listener.Views.SongsFind({collection: songs, suffix: suffix})
    this._swapView(view);
  },

  _swapView: function (view) {
    this.currentView && this.currentView.remove();
    this.currentView = view;
    this.$rootEl.html(view.render().$el);
  },
});
