Listener.Views.AddedSongs = Backbone.CompositeView.extend({
  template: JST['users/added_songs'],

  className: 'added-songs',

  initialize: function(options){
  },

  addSong: function (song) {
    var view = new Listener.Views.SongListShow({
      model: song,
      collection: this.model.addedSongs(),
      compressed_template: true
    });
    this.addSubview('section#added-songs', view);
  },

  render: function () {
    this.$el.html(this.template({model: this.model}))
    this.model.addedSongs().each(this.addSong.bind(this));
    return this;
  },

});
