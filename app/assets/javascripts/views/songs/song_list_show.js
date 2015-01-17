Listener.Views.SongListShow = Backbone.CompositeView.extend({
  template: JST['songs/list_show'],

  className: 'song-show',

  events: {
    'click .favorite': 'toggleFavorite',
  },

  initialize: function (options) {
    this.listenTo(this.model, 'sync', this.render)
    this.listenTo(Listener.currentUser, 'sync', this.render)
  },

  render: function () {
    this.$el.html(this.template({song: this.model}))
    return this;
  },

  toggleFavorite: function (event) {
    event.preventDefault();
    var button = $(event.currentTarget)
    var song_id = button.data('id');
    Listener.currentUser.toggleFavorite(song_id);
    button.toggleClass("unfavorite");
  },
});
