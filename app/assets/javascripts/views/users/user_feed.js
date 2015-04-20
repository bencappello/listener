Listener.Views.UserFeed = Backbone.CompositeView.extend({
  template: JST['users/feed'],

  className: 'feed',

  initialize: function(options){
    this.listenTo(this.model, "sync", this.render)
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

});
