Backbone.SharedModel = Backbone.Model.extend ({
  songs: function (model) {
    if(!this._songs) {
      this._songs = new Listener.Collections.Songs([], { parent: this });
    }
    return this._songs;
  },

  tags: function () {
    if(!this._tags) {
      this._tags = new Listener.Collections.Tags([], { parent: this });
    }
    return this._tags;
  },

  songs: function () {
    if(!this._songs) {
      this._songs = new Listener.Collections.Songs([], { parent: this });
    }
    return this._songs;
  },

  parse: function (response) {
    if(response.songs) {
      this.songs().set(response.songs, { parse: true });
      delete response.songs;
    }
    if(response.tags) {
      this.tags().set(response.tags, { parse: true });
      delete response.tags;
    }
    if(response.comments) {
      this.comments().set(response.comments, { parse: true });
      delete response.comments;
    }
    return response;
  },
})
