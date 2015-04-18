Listener.Views.SongsFind = Backbone.CompositeView.extend({
  template: JST['songs/find'],

  className: 'find',

  initialize: function (options) {
    Backbone.GeneralView.prototype.initialize.call(this);
    this.suffix = options.suffix;
    this.listenTo(this.collection, 'sync', this.render)
    this.listenForScroll();
    this.newSongs = new Listener.Collections.Songs();
  },

  render: function () {
    this.$el.html(this.template({songs: this.collection, title: this.suffix}))
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
    var throttledCallback = _.throttle(this.nextPage.bind(this), 300, {leading: false});
    $(window).on("scroll", throttledCallback);
  },

  nextPage: function () {
    var view = this;
    if ($(window).scrollTop() > $(document).height() - $(window).height() - 50) {
      var pageN = view.newSongs.page_number || 1
      if (pageN < view.collection.total_pages) {
        view.newSongs.fetch({
          data: { page: pageN + 1, find: view.suffix},
          success: function () {
            view.newSongs.each(function(song){
              view.addSong(song);
              view.collection.add(song);
              song.collection = view.collection;
            });
          }
        });
      }
    }
  }
});
