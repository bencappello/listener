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

    //makes an ajax request to create or destroy 'favorite' join table row.
    Listener.currentUser.toggleFavorite(this.model.id);
    button.toggleClass("unfavorite");
    this.parentModel && this.parentModel.fetch();

    //update favoriters count
    if (this.count != 0) {
      this.count = this.count || parseInt(this.model.escape('favoriters_count'))
    }
    this.count = button.hasClass('unfavorite') ? this.count + 1 : this.count - 1
    this.$('#favorite-count').html(this.count);
  },

  renderFavoriteCount: function () {
    count = $('<span>' + this.model.get('favoriters_count') + '</span>');
    $('#favorite-count').html(count);
  },
});
