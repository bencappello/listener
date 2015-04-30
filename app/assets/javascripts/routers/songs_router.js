Listener.Routers.SongsRouter = Backbone.Router.extend ({
  initialize: function () {
    this.$rootEl = $('#content');
    this.songs = new Listener.Collections.Songs();
  },

  routes: {
    '': 'find',
    'songs/:id': 'songShow',
    'songs/search/:query': 'search',
    'songs/find/:suffix': 'find',
  },

  songShow: function (id) {
    Listener.currentUser.fetch();
    var song = this.songs.getOrFetch(id)
    var view = new Listener.Views.SongShow({model: song});
    this._swapView(view);

    //if tour not ended
    if (Listener.tour) {
      view.startNewTour({
        wait: 700,
      });
    }
  },

  search: function (query, page) {
    page = page || 1
    var results = new Listener.Collections.Songs();
    results.fetch ({
      data: {query: query, page: page},
      success: function () {
        Listener.audioPlayer.maybeLoadSong(results.at(0));

        if (Listener.tour) {
          view.startNewTour({
            wait: 400,
          });
        }
      }
    })
    var view = new Listener.Views.SongsSearch({collection: results, query: query})
    this._swapView(view);
  },

  find: function (suffix, page) {
    page = page || 1
    suffix = suffix || 'popular_now'
    var songs = new Listener.Collections.Songs();
    songs.fetch ({
      data: {find: suffix, page: page},
      success: function () {
        Listener.audioPlayer.maybeLoadSong(songs.at(0));

        //if tour active start tour
        if (Listener.tour) {
          view.startNewTour({
            wait: 400,
          });
        }
      }
    })
    var view = new Listener.Views.SongsFind({collection: songs, suffix: suffix})
    this._swapView(view);
  },

  _swapView: function (view) {
    Listener._currentView && Listener._currentView.remove();
    Listener._currentView = view;
    this.$rootEl.html(view.render().$el);
  },
});
