Listener.Views.UserFeed = Backbone.CompositeView.extend({
  template: JST['users/feed'],

  className: 'feed',

  initialize: function(options){
  },

  addSong: function (song) {
    var view = new Listener.Views.SongListShow({
      model: song,
      collection: this.model.feedSongs(),
    });
    this.addSubview('section#feed-songs', view);
  },

  render: function () {
    this.$el.html(this.template({model: this.model}))
    this.model.feedSongs().each(this.addSong.bind(this));
    return this;
  },

});
