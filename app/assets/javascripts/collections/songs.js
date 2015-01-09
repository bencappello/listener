Listener.Collections.Songs = Backbone.Collection.extend({
  model: Listener.Models.Song,
  url: 'api/songs',

  initialize: function (options) {
    this.band = options.band
  },

  getOrFetch: function (id) {
    var song = this.get(id);

    if(!song) {
      song = new Listener.Models.Song({ id: id });
      song.fetch({
        success: function () {
          this.add(song);
        }.bind(this)
      });
    } else {
      song.fetch();
    }

    return song;
  },

});
