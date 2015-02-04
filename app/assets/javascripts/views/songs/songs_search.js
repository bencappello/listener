Listener.Views.SongSearch = Backbone.CompositeView.extend({
  template: JST['songs/search'],
  findTemplate: JST['songs/find'],

  className: 'songs-search',

  initialize: function (options) {
    Backbone.GeneralView.prototype.initialize.call(this);
    this.query = options.query
    this.listenTo(this.collection, 'sync', this.render)
    this.listenForScroll();
    this.newSongs = new Listener.Collections.Songs();
  },

  render: function () {
    this.$el.html(this.template({songs: this.collection, query: this.query}))
    this.renderSongs();
    return this;
  },

  addSong: function (song) {
    var view = new Listener.Views.SongListShow({
      model: song,
    });
    this.addSubview('section#songs', view);
  },

  renderSongs: function () {
    this.$el.find('section#songs').empty();
    this.collection.each(this.addSong.bind(this));
  },

  listenForScroll: function () {
    debugger
    // $(window).off("scroll"); // remove previous listeners
    var throttledCallback = _.throttle(this.nextPage.bind(this), 200, {leading: false});
    $(window).on("scroll", throttledCallback);
  },

  nextPage: function () {
    var view = this;
    if ($(window).scrollTop() > $(document).height() - $(window).height() - 50) {
      var pageN = view.newSongs.page_number || 1
      if (pageN < view.collection.total_pages) {
        view.newSongs.fetch({
          data: { page: pageN + 1, query: view.query},
          success: function () {
            view.newSongs.each(view.addSong.bind(view));
          }
        });
      }
    }
  }
});
