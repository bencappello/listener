Listener.Views.SongListShow = Backbone.CompositeView.extend({
  template: JST['songs/list_show'],

  className: 'song-show',

  events: {
    'click .favorite': 'toggleFavorite',
  },

  initialize: function (options) {
    this.listenTo(this.model, 'sync', this.render)
    this.parentModel = options.parentModel;
    // this.listenTo(Listener.currentUser, 'sync', this.render)
  },

  render: function () {
    this.$el.html(this.template({song: this.model}))
    this.renderFavoriteCount();
    return this;
  },

  toggleFavorite: function (event) {
    event.preventDefault();
    var button = $(event.currentTarget)
    Listener.currentUser.toggleFavorite(this.model.id);

    var count = this.model.escape('favoriters_count');
    count = button.hasClass(unfavorite) ? count - 1 : count + 1
    $('#favorite-count').html(count);
    
    button.toggleClass("unfavorite");
    this.parentModel && this.parentModel.fetch();
  },

  renderFavoriteCount: function () {
    count = $('<span>' + this.model.get('favoriters_count') + '</span>');
    $('#favorite-count').html(count);
  },
});
