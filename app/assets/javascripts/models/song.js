Listener.Models.Song = Backbone.Model.extend ({
  urlRoot: 'api/songs',

  toJSON: function(){
    var json = { song: _.clone(this.attributes) };
    return json;
  },

  tags: function () {
    if(!this._tags) {
      this._tags = new Listener.Collections.Tags([], { parent: this });
    }
    return this._tags;
  },

  comments: function () {
    if(!this._comments) {
      this._comments = new Listener.Collections.Comments([], { parent: this });
    }
    return this._comments;
  },

  parse: function (response) {
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
});
