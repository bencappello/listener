Listener.Views.SongsFind = Backbone.CompositeView.extend({
  template: JST['songs/find'],

  className: 'find',

  initialize: function (options) {
    Backbone.GeneralView.prototype.initialize.call(this);
    this.suffix = options.suffix;
    this.timeOut = false;
    this.rank = 1; //the current song rank starts at 1
    this.newSongs = new Listener.Collections.Songs();
    this.listenTo(this.collection, 'sync', this.render)
    this.listenForScroll();
  },

  render: function () {
    debugger
    this.$el.html(this.template({songs: this.collection, title: this.suffix}))
    this.renderSongs();
    return this;
  },

  addSong: function (song) {
    var view = new Listener.Views.SongListShow({
      model: song,
      rankInfo: {rank: this.rank, page: this.suffix}
    });
    this.addSubview('section#songs', view);
    this.rank += 1;
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
