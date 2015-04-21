Listener.Views.UserFeed = Backbone.CompositeView.extend({
  template: JST['users/feed'],

  className: 'feed',

  initialize: function(options){
    Backbone.GeneralView.prototype.initialize.call(this);
    this.collection = this.model.feedSongs();
    this.newSongs = new Listener.Collections.Songs();
    this.timeOut = false;
    this.listenTo(this.collection, "sync", this.render);
    this.listenForScroll();
  },

  addSong: function (song) {
    var view = new Listener.Views.SongListShow({
      model: song,
      collection: this.model.feedSongs(),
      compressed_template: true
    });
    this.addSubview('section#feed-songs', view);
  },

  render: function () {
    this.$el.html(this.template({model: this.model}))
    this.model.feedSongs().each(this.addSong.bind(this));
    return this;
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
          data: {user_id: view.model.id, content: 'feed', page: pageN + 1},
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
