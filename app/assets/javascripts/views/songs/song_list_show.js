Listener.Views.SongListShow = Backbone.CompositeView.extend({
  template: JST['songs/list_show'],
  compressed_template: JST['songs/list_show_compressed'],

  className: 'list-song',

  events: {
    'click button.favorite': 'toggleFavorite',
    'click #play-btn': 'playSong',
  },

  initialize: function (options) {
    this.listenTo(this.model, 'sync', this.render)
    this.parentModel = options.parentModel;
    if (options.compressed_template) {
      this.template = this.compressed_template;
    }
  },

  render: function () {
    this.$el.html(this.template({song: this.model}))
    return this;
  },

  toggleFavorite: function (event) {
    if (event) {
      event.preventDefault();
    }
    var callback = this.toggleFavorite.bind(this);
    if (!this._requireSignedIn(callback)) { return; }

    //makes an ajax request to create or destroy 'favorite' join table row.
    Listener.currentUser.toggleFavorite(this.model.id);
    this.$('.favorite').toggleClass("unfavorite");
    this.parentModel && this.parentModel.fetch();

    //update favoriters count
    if (this.count != 0) {
      this.count = this.count || parseInt(this.model.escape('favoriters_count'))
    }
    this.count = this.$('.favorite').hasClass('unfavorite') ? this.count + 1 : this.count - 1
    this.$('#favorite-count').html(this.count);
  },

  playSong: function () {
    Listener.audioPlayer.changeSong(this.model);
  },
});
