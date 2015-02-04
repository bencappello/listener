Listener.Models.Song = Backbone.Model.extend ({
  urlRoot: 'api/songs',

  toJSON: function(){
    var json = { song: _.clone(this.attributes) };

    if (this._audio) {
      json.song.audio = this._audio;
    }
    if (this._image) {
      json.song.image = this._image;
    }
    return json;
  },

  fullName: function () {
    var remixName;
    if (this.escape('song_type') == 'remix') {
      remixName = this.escape('name') + " (Remix)";
    } else {
      remixName = this.escape('name');
    }
    return remixName;
  },

  postTime: function () {
    var postDate = new Date(this.get('created_at'));
    var diff = Date.now() - Date.parse(postDate);
    var time;
    var sfx;
    if ( diff < 3600000) {
      time = 'less than an hr ago';
    } else if (diff < 86457091) {
      time = Math.floor((diff / (60000 * 60)).toString())
      sfx = (time == 1) ? ' hr ago' : ' hrs ago';
      time = time.toString() + sfx;
    } else if (diff < 604918332 ) {
      time = Math.floor((diff / (60000 * 60 * 24)));
      sfx = (time == 1) ? ' day ago' : ' days ago';
      time = time.toString() + sfx;
    } else {
      time = 'on ' + postDate.toLocaleDateString();
    }
    return time;
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
