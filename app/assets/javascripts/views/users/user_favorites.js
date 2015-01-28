Listener.Views.UserFavorites = Backbone.CompositeView.extend({
  template: JST['users/favorites'],

  className: 'favorites',

  initialize: function(options){
  },

  addSong: function (song) {
    var view = new Listener.Views.SongListShow({
      model: song,
    });
    this.addSubview('section#favorite-songs', view);
  },

  render: function () {
    this.$el.html(this.template({model: this.model}))
    this.model.favoriteSongs().each(this.addSong.bind(this));
    return this;
  },

});
