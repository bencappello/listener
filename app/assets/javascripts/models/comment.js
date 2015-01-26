Listener.Models.Comment = Backbone.Model.extend ({
  urlRoot: 'api/comments',

  initialize: function (options) {
  },

  toJSON: function(){
    var json = { comment: _.clone(this.attributes) };

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
      sfx = (time == 1) ? ' hr ago' : ' hrs ago';
      time = time.toString() + sfx;
    } else {
      time = 'on ' + postDate.toLocaleDateString();
    }
    return time;
  },
});
