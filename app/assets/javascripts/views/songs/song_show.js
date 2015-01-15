Listener.Views.SongShow = Backbone.CommentableView.extend({
  template: JST['songs/show'],

  className: 'song-show',

  events: {
    'click .favorite': 'toggleFavorite',
  },

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render)
    this.listenTo(this.model.comments(), 'sync', this.renderComments)
    this.listenTo(Listener.currentUser, 'sync', this.render)
  },

  render: function () {
    this.$el.html(this.template({song: this.model}))
    this.renderComments();
    this.renderCommentForm('Song');
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
