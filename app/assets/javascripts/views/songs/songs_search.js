Listener.Views.SongsSearch = Backbone.CompositeView.extend({
  template: JST['songs/search'],

  className: 'find',

  initialize: function (options) {
    Backbone.GeneralView.prototype.initialize.call(this);
    this.query = options.query
    this.newSongs = new Listener.Collections.Songs();
    this.timeOut = false;
    this.listenTo(this.collection, 'sync', this.render)
    this.listenForScroll();
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
    $(window).on("scroll", this.nextPage.bind(this));
  },

  nextPage: function () {
    var view = this;
    if ($(window).scrollTop() > $(document).height() - $(window).height() - 50 &&
        this.timeOut === false) {
      this.timeOut = true;
      setTimeout(function(){ view.timeOut = false }, 1000);

      var pageN = view.newSongs.page_number || 1
      if (pageN < view.collection.total_pages) {
        view.newSongs.fetch({
          data: { page: pageN + 1, query: view.query},
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
