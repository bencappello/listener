Listener.Views.SongShow = Backbone.CommentableView.extend({
  template: JST['songs/show'],

  className: 'song-show',

  events: {
    'click .favorite': 'toggleFavorite',
  },

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render)
    this.listenTo(this.model.comments(), 'sync', this.renderComments)
    // this.listenTo(Listener.currentUser, 'sync', this.render)
  },

  render: function () {
    this.$el.html(this.template({song: this.model}))
    this.renderFavoriteCount();
    this.renderComments();
    this.renderCommentForm('Song');
    return this;
  },

  toggleFavorite: function (event) {
    event.preventDefault();
    var button = $(event.currentTarget)
    Listener.currentUser.toggleFavorite(this.model.id);
    debugger
    var count = parseInt($('#favorite-count').html())
    count = button.hasClass('unfavorite') ? count - 1 : count + 1
    $('#favorite-count').html(count);

    button.toggleClass("unfavorite");
  },

  renderFavoriteCount: function () {
    count = $('<span>' + this.model.get('favoriters_count') + '</span>');
    $('#favorite-count').html(count);
  },
});
