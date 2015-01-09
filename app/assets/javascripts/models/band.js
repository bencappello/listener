Listener.Models.Band = Backbone.Model.extend ({
  urlRoot: 'api/bands',

  songs: function () {
    if(!this._songs) {
      this._songs = new Listener.Collections.Songs([], { band: this });
    }
    return this._songs;
  },

  parse: function (response) {
    if(response.songs) {
      this.songs().set(response.songs, { parse: true });
      delete response.songs;
    }
    return response;
  },
});
