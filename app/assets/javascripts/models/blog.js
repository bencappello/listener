Listener.Models.Blog = Backbone.Model.extend ({
  urlRoot: 'api/blogs',

  toJSON: function(){
    var json = { blog: _.clone(this.attributes) };
    return json;
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

  songs: function () {
    if(!this._songs) {
      this._songs = new Listener.Collections.Songs();
    }
    return this._songs;
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
});
