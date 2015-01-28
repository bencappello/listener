Listener.Views.SongShow = Backbone.CommentableView.extend({
  template: JST['songs/show'],

  className: 'song-show',

  events: {
    'click .favorite': 'toggleFavorite',
    'click .edit': 'editSong',
  },

  initialize: function () {
    Backbone.GeneralView.prototype.initialize.call(this);
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
    if (event) {
      event.preventDefault();
      $(event.currentTarget).addClass('hello');
    }
    var callback = this.toggleFavorite.bind(this);
    if (!this._requireSignedIn(callback)) { return; }

    //makes an ajax request to create or destroy 'favorite' join table row.
    Listener.currentUser.toggleFavorite(this.model.id);
    this.$('.favorite').toggleClass("unfavorite");

    //update favoriters count
    if (this.count != 0) {
      this.count = this.count || parseInt(this.model.escape('favoriters_count'))
    }
    this.count = this.$('.favorite').hasClass('unfavorite') ? this.count + 1 : this.count - 1
    this.$('#favorite-count').html(this.count);
  },

  renderFavoriteCount: function () {
    count = $('<span>' + this.model.get('favoriters_count') + '</span>');
    $('#favorite-count').html(count);
  },

  editSong: function (event) {
    event.preventDefault();
    var song = this.model
    var view = new Listener.Views.SongForm({
      model: song,
      edit: true
    })
    Listener.modalRouter.trigger('swapModal', view)
  },
});
